The solution implements a serverless "Savings Plan Buy" feature where users configure recurring bitcoin purchases via an API Gateway, which triggers Lambda functions to process requests and store plans in an encrypted DynamoDB table. EventBridge handles scheduling and orchestrates purchase executions, while all events are archived for compliance. The infrastructure is deployed via CDK with proper monitoring, logging, and security controls.


###Step-by-Step Flow Explanation###

User Request Flow:

- Frontend → API Gateway (REST endpoint)
→ Routes to User Config Lambda (Creates/updates savings plan)
→ Writes to DynamoDB (Persists plan details with userId and planId)



Event-Driven Scheduling:

User Config Lambda emits "PlanCreated" event to EventBridge
EventBridge triggers Scheduler Lambda (Sets up cron-based rules)
Scheduler invokes Execution Lambda at defined intervals



Purchase Execution:

Execution Lambda processes bitcoin purchase
Updates DynamoDB record with transaction status
Publishes results to SNS Topic (Success/Failure notifications)



Notifications & Audit:

SNS → Triggers Lambda (Sends email/SMS alerts)
All transactions logged to S3 via CloudTrail (Immutable audit trail)
