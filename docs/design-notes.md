# Design Notes

## Overview

This document outlines the key design decisions and microservice boundaries for the **Savings Plan Buy** feature in our regulated Bitcoin broker platform. The architecture is fully serverless, prioritizing scalability, security, auditability, and maintainability in line with fintech and crypto compliance requirements.

---

## Microservice Boundaries

The solution is broken down into the following microservices/domains:

1. **Savings Plan Manager**  
   - Handles creation, update, and deletion of user savings plans (recurring buy configurations).
   - Exposes API endpoints for user interaction.
   - Persists plan data securely.

2. **Purchase Orchestrator**  
   - Schedules and triggers recurring Bitcoin purchase events based on user plans.
   - Integrates with AWS EventBridge Scheduler.

3. **Transaction Processor**  
   - Executes the actual Bitcoin purchase transactions.
   - Handles interaction with external exchanges and payment providers.
   - Manages error handling, retries, and dead-letter queues.

4. **Notification Service**  
   - Sends notifications (email, SMS, push) to users regarding plan status and purchase outcomes.

5. **Audit & Compliance Service**  
   - Aggregates logs, tracks data changes, and ensures audit trails are immutable and retained as required.

---

## Implemented Microservice

**Savings Plan Manager**  
*This is the microservice implemented in this codebase.*

**Purpose:**  
- Provides a secure API for users to create and manage their recurring Bitcoin savings plans.
- Validates and persists plan details (amount, schedule, funding source) in DynamoDB.
- Ensures all operations are logged for auditability.
- Applies encryption, point-in-time recovery, and least-privilege IAM policies for compliance.

---

## Key Design Decisions

- **Serverless First:**  
  All compute is handled by AWS Lambda, ensuring scalability and cost efficiency.

- **Event-Driven Architecture:**  
  EventBridge (planned) will be used for orchestration of scheduled purchases, enabling loose coupling between services.

- **Separation of Concerns:**  
  Each microservice is responsible for a single domain, allowing for independent development, scaling, and compliance checks.

- **Security & Compliance:**  
  - DynamoDB tables are encrypted at rest.
  - Point-in-time recovery is enabled for all critical data.
  - API Gateway enforces HTTPS and logs all access.
  - Lambda functions have retries, dead-letter queues, and X-Ray tracing enabled.
  - IAM roles follow least-privilege principles.

- **Auditability:**  
  - All API and Lambda actions are logged to CloudWatch with retention policies.
  - DynamoDB Streams (planned) will be used for tracking changes for audit purposes.

- **Environment Isolation:**  
  Separate configuration files and deployment environments (staging, prod) ensure safe rollout and testing.

- **Migration Ready:**  
  The codebase is modular and structured to support future migration to Terraform, as described in the migration plan.

---

## Summary

- **All microservices:**  
  - Savings Plan Manager (implemented)  
  - Purchase Orchestrator  
  - Transaction Processor  
  - Notification Service  
  - Audit & Compliance Service

- **This submission implements:**  
  The **Savings Plan Manager**, providing the core API and data persistence for user recurring buy plans, with a focus on security, auditability, and regulatory compliance.

---

