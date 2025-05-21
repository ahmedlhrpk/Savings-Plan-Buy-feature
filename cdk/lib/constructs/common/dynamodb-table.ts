import { Construct } from 'constructs';
import * as dynamodb from 'aws-cdk-lib/aws-dynamodb';
import * as cdk from 'aws-cdk-lib';

export interface CompliantTableProps extends dynamodb.TableProps {}

export class CompliantTable extends dynamodb.Table {
  constructor(scope: Construct, id: string, props: CompliantTableProps) {
    super(scope, id, {
      encryption: dynamodb.TableEncryption.AWS_MANAGED,
      pointInTimeRecovery: true,
      removalPolicy: cdk.RemovalPolicy.RETAIN,
      ...props,
    });
  }
}
