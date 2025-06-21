# Data Contracts

This directory contains interface contracts for data models, schemas, and data flow specifications.

## Contract Types

### Data Model Contracts
Specifications for data structures including:
- Entity definitions and relationships
- Field specifications and constraints
- Validation rules
- Data lifecycle management

### Schema Contracts
Database and message schema definitions including:
- Table structures
- Index specifications
- Migration procedures
- Data integrity constraints

### Data Flow Contracts
Data movement and transformation specifications including:
- ETL pipeline definitions
- Data transformation rules
- Data quality requirements
- Performance expectations

## Contract Template

When creating new data contracts, use this structure:

```yaml
---
status: draft|active|deprecated|archived
version: x.y.z
created: YYYY-MM-DD
last_updated: YYYY-MM-DD
owner: [role-name]
consumers: [list-of-consuming-roles]
data_classification: public|internal|confidential|restricted
superseded_by: [contract-name if superseded]
deprecation_date: YYYY-MM-DD
---
```

## File Naming Convention

- `{entity-name}-model-{version}.md` - For data model contracts
- `{schema-name}-schema-{version}.md` - For schema contracts
- `{pipeline-name}-flow-{version}.md` - For data flow contracts

Examples:
- `user-model-v1.md`
- `transaction-schema-v2.md`
- `analytics-pipeline-flow-v1.md`