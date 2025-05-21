import { Construct } from 'constructs';
import * as lambda from 'aws-cdk-lib/aws-lambda';
import * as dynamodb from 'aws-cdk-lib/aws-dynamodb';
import * as apigateway from 'aws-cdk-lib/aws-apigateway';
import * as cdk from 'aws-cdk-lib';

export interface SavingsPlanConstructProps {
  readonly tableName: string;
}

export class SavingsPlanConstruct extends Construct {
  public readonly planTable: dynamodb.Table;
  public readonly planLambda: lambda.Function;
  public readonly api: apigateway.RestApi;

  constructor(scope: Construct, id: string, props: SavingsPlanConstructProps) {
    super(scope, id);

    // DynamoDB table with encryption and PITR for audit compliance
    this.planTable = new dynamodb.Table(this, 'PlansTable', {
      tableName: props.tableName,
      partitionKey: { name: 'userId', type: dynamodb.AttributeType.STRING },
      sortKey: { name: 'planId', type: dynamodb.AttributeType.STRING },
      billingMode: dynamodb.BillingMode.PAY_PER_REQUEST,
      encryption: dynamodb.TableEncryption.AWS_MANAGED,
      pointInTimeRecovery: true,
      removalPolicy: cdk.RemovalPolicy.RETAIN,
    });

    // Lambda function with environment variables and retries
    this.planLambda = new lambda.Function(this, 'PlanManagerLambda', {
      runtime: lambda.Runtime.NODEJS_20_X,
      handler: 'handler.main',
      code: lambda.Code.fromAsset('lambda/savings-plan/plan-manager'),
      environment: {
        PLANS_TABLE_NAME: this.planTable.tableName,
      },
      retryAttempts: 2,
      deadLetterQueueEnabled: true,
      tracing: lambda.Tracing.ACTIVE,
    });

    this.planTable.grantReadWriteData(this.planLambda);

    // API Gateway to expose Lambda
    this.api = new apigateway.RestApi(this, 'SavingsPlanApi', {
      restApiName: 'Savings Plan Service',
      deployOptions: {
        stageName: 'prod',
        loggingLevel: apigateway.MethodLoggingLevel.INFO,
        dataTraceEnabled: true,
        metricsEnabled: true,
      },
    });

    const plansResource = this.api.root.addResource('plans');
    plansResource.addMethod('POST', new apigateway.LambdaIntegration(this.planLambda));
  }
}
