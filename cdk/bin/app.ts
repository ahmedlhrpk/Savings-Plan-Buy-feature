#!/usr/bin/env node
import * as cdk from 'aws-cdk-lib';
import { SavingsPlanStack } from '../lib/stacks/savings-plan-stack';

const app = new cdk.App();

const env = {
  account: process.env.CDK_DEFAULT_ACCOUNT,
  region: process.env.CDK_DEFAULT_REGION,
};

new SavingsPlanStack(app, 'SavingsPlanStack', { env });
