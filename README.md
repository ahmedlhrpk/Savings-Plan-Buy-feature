# Savings Plan Buy - Infrastructure as Code (CDK)

## Project Summary

This repository contains the AWS infrastructure code for the **Savings Plan Buy** feature of a regulated Bitcoin broker platform. The feature enables users to set up recurring Bitcoin purchases with configurable parameters such as amount, schedule, and source of funds.

The infrastructure is implemented using **AWS CDK (TypeScript)** and follows best practices for:

- **Scalability & Fault Tolerance:** Serverless architecture with DynamoDB, Lambda, and API Gateway.
- **Regulatory Compliance:** Encryption at rest, point-in-time recovery, audit logging, and least-privilege IAM policies.
- **Observability:** CloudWatch logging, API Gateway access logs, Lambda retries, dead-letter queues, and X-Ray tracing.
- **Modular Design:** Reusable constructs and clear domain boundaries.
- **Migration Readiness:** Designed with a future migration to Terraform in mind.

---

## Repository Structure


![image](https://github.com/user-attachments/assets/eee15a64-da8e-4cb4-8986-0672d3ee8648)






---

## Setup Instructions

### Prerequisites

- Node.js (v18+ recommended)
- AWS CLI configured with credentials and default region
- AWS CDK CLI installed globally (`npm install -g aws-cdk`)
- Yarn or npm package manager


---

## Compliance and Best Practices

- **Encryption:** DynamoDB tables are encrypted with AWS-managed keys; Lambda environment variables are secured.
- **Auditability:** CloudWatch logs and API Gateway access logs are enabled with retention policies.
- **Observability:** Lambda functions have retries and dead-letter queues; AWS X-Ray tracing is enabled.
- **Separation of Concerns:** Infrastructure code is modularized into constructs and stacks.
- **Environment Management:** Separate config files for staging and production environments.
- **Migration:** Includes a detailed migration plan (`docs/migration-plan.md`) for transitioning from CDK to Terraform.

---

## Future Work

- Implement the transaction processor microservice for executing scheduled purchases.
- Integrate EventBridge for scheduling recurring purchase triggers.
- Enhance notification mechanisms via SNS or other channels.
- Complete migration to Terraform following the documented plan.




