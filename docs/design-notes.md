The solution implements a serverless "Savings Plan Buy" feature where users configure recurring bitcoin purchases via an API Gateway, which triggers Lambda functions to process requests and store plans in an encrypted DynamoDB table. EventBridge handles scheduling and orchestrates purchase executions, while all events are archived for compliance. The infrastructure is deployed via CDK with proper monitoring, logging, and security controls.


###Step-by-Step Flow Explanation###

- User Request Flow:

Frontend → API Gateway (REST endpoint)
→ Routes to User Config Lambda (Creates/updates savings plan)
→ Writes to DynamoDB (Persists plan details with userId and planId)



- Event-Driven Scheduling:

User Config Lambda emits "PlanCreated" event to EventBridge
EventBridge triggers Scheduler Lambda (Sets up cron-based rules)
Scheduler invokes Execution Lambda at defined intervals



- Purchase Execution:

Execution Lambda processes bitcoin purchase
Updates DynamoDB record with transaction status
Publishes results to SNS Topic (Success/Failure notifications)



- Notifications & Audit:

SNS → Triggers Lambda (Sends email/SMS alerts)
All transactions logged to S3 via CloudTrail (Immutable audit trail)











Domain/Microservice Boundaries
- User Configuration Service

Handles CRUD operations for savings plans
Exposes REST API via API Gateway
Stores configurations in DynamoDB

- Scheduler Service

Uses EventBridge rules to trigger purchases
Maintains execution state in DynamoDB

- Execution Service

Processes actual bitcoin purchases
Integrates with payment processor
Updates transaction records

- Notification Service

Sends user notifications via SNS/SMS/Email
Maintains notification history

- Audit Service

Captures all critical events
Stores immutable logs in S3 with Glacier transition



Design Considerations
Scalability and Fault Tolerance

All Lambda functions configured with appropriate concurrency limits

DynamoDB tables with auto-scaling capacity

Dead-letter queues for failed events

Circuit breakers for external integrations

Orchestration Approach

Hybrid model using EventBridge for scheduling (orchestration) and SQS for decoupled processing (choreography)

EventBridge rules trigger the execution pipeline

SQS queues handle retries and backpressure

Regulatory/Audit Concerns

All financial transactions logged immutably in S3 with versioning

CloudTrail enabled for all API calls

KMS encryption for data at rest and in transit

IAM policies following principle of least privilege

Data retention policies aligned with financial regulations

Deployment Environments

Separate AWS accounts for dev/staging/production

Infrastructure deployed via CI/CD pipeline

Feature flags for gradual rollouts

Blue/green deployment for critical components

CI/CD Pipeline

GitHub Actions for build/test/deploy

Infrastructure tests using CDK assertions

Automated security scanning

Manual approval gates for production

Monitoring

CloudWatch dashboards for key metrics

Alarms for error rates and latency

X-Ray for distributed tracing

Regular audit reports
