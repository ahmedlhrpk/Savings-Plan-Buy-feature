import * as cdk from 'aws-cdk-lib';
import { Construct } from 'constructs';
import { SavingsPlanConstruct } from '../constructs/savings-plan';

export class SavingsPlanStack extends cdk.Stack {
  constructor(scope: Construct, id: string, props?: cdk.StackProps) {
    super(scope, id, props);

    new SavingsPlanConstruct(this, 'SavingsPlanConstruct', {
      tableName: 'SavingsPlanTable',
    });
  }
}
