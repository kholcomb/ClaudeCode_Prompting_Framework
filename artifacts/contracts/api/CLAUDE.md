# API Contracts

This directory contains interface contracts for API specifications and documentation.

## Contract Types

### Endpoint Contracts
Specifications for individual API endpoints including:
- Request/response schemas
- Authentication requirements
- Rate limiting policies
- Error handling

### Service Contracts
Higher-level service interface definitions including:
- Service responsibilities
- Integration patterns
- Data flow specifications
- Performance requirements

## Contract Template

When creating new API contracts, use this structure:

```yaml
---
status: draft|active|deprecated|archived
version: x.y.z
created: YYYY-MM-DD
last_updated: YYYY-MM-DD
owner: [role-name]
consumers: [list-of-consuming-roles]
superseded_by: [contract-name if superseded]
deprecation_date: YYYY-MM-DD
---
```

## File Naming Convention

- `{service-name}-{version}.md` - For service-level contracts
- `{endpoint-name}-api-{version}.md` - For endpoint-specific contracts
- `{integration-name}-contract-{version}.md` - For integration contracts

Examples:
- `user-authentication-v1.md`
- `payment-processing-api-v2.md`
- `notification-service-contract-v1.md`