import { Construct } from 'constructs';
import * as lambda from 'aws-cdk-lib/aws-lambda';

export interface ResilientLambdaProps extends lambda.FunctionOptions {}

export class ResilientLambda extends lambda.Function {
  constructor(scope: Construct, id: string, props: ResilientLambdaProps) {
    super(scope, id, {
      retryAttempts: 2,
      deadLetterQueueEnabled: true,
      tracing: lambda.Tracing.ACTIVE,
      ...props,
    });
  }
}
