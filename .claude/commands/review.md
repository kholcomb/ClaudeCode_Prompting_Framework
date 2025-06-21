---
allowed-tools: Read(*), Grep(*), Glob(*), Bash(*)
description: Request comprehensive review of artifacts, code, or documentation
---

# Artifact Review Request

## Context
- Target artifact: [specified in command]
- Current project specs: @specs/requirements.md @specs/architecture.md
- Quality standards: @artifacts/contracts/testing/quality-standards.md
- Security guidelines: @artifacts/contracts/security/security-standards.md

## Your Task
Conduct a thorough review of the specified artifact involving appropriate team roles:

1. **Determine Review Scope**: Identify which roles should participate based on artifact type
2. **Quality Assessment**: Evaluate against established standards and requirements
3. **Cross-Role Validation**: Check for integration impacts and dependencies
4. **Contract Compliance**: Verify adherence to relevant interface contracts
5. **Security Review**: Include security implications and compliance requirements

## Response Format
```
🔍 Review Request: [Artifact Name]
Artifact Type: [code/documentation/design/contract]
Review Date: [timestamp]

## Review Team
Primary Reviewer: [main responsible role]
Secondary Reviewers: [supporting roles]
QA Validation: [QA Engineer involvement]

## Review Criteria
✓ Functional Requirements
✓ Technical Standards
✓ Security Compliance
✓ Performance Implications
✓ Integration Compatibility
✓ Documentation Completeness

## Findings

### 🟢 Strengths
- [Positive aspects]
- [Well-implemented areas]

### 🟡 Recommendations
- [Improvement suggestions]
- [Enhancement opportunities]

### 🔴 Issues
- [Critical problems]
- [Must-fix items]

### 🔒 Security Review
- [Security assessment]
- [Vulnerability analysis]
- [Compliance status]

## Contract Impact
- Affects Contracts: [list of impacted contracts]
- New Contracts Needed: [contracts to be created]
- Deprecation Impact: [contracts that may be deprecated]

## Approval Status
✅ Approved | ❌ Needs Changes | ⏸️ Conditional Approval

## Next Steps
1. [Action item 1]
2. [Action item 2]
3. [Follow-up requirements]
```

Include specific line references for code reviews using file_path:line_number format.