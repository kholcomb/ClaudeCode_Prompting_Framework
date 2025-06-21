---
allowed-tools: Read(*), Write(*), Edit(*), MultiEdit(*), Bash(*), Grep(*), Glob(*)
description: Synchronize project documentation with code changes
---

# Documentation Synchronization

## Context
- Project code: @project/
- Current specifications: @specs/
- Interface contracts: @artifacts/contracts/
- Recent code changes: !`cd project && git log --oneline -10`
- Documentation files: !`find specs -name "*.md" -type f`

## Your Task
Synchronize project documentation with actual code implementation:

1. **Code Analysis**: Review recent changes in project/ directory
2. **Specification Gap Analysis**: Compare specs with actual implementation
3. **Contract Validation**: Ensure interface contracts match current APIs
4. **Documentation Updates**: Update specs to reflect current code state
5. **Change Impact**: Identify downstream impacts of code changes

## Synchronization Areas

### API Documentation
- Compare specs/apis/ with actual API implementations
- Update endpoint documentation with current routes and parameters
- Sync authentication and authorization requirements
- Validate response schemas and error handling

### Architecture Documentation
- Review specs/architecture.md against current system structure
- Update component diagrams and integration patterns
- Sync database schema documentation
- Validate deployment architecture

### Requirements Traceability
- Ensure specs/requirements.md reflects implemented features
- Update feature status and completion tracking
- Sync non-functional requirements with current performance
- Validate compliance and regulatory requirements

## Response Format
```
🔄 Documentation Sync Report
Sync Date: [timestamp]
Code Analysis: [last commit range reviewed]

## Sync Status
✅ **Up to Date**: [count] documents in sync
🔄 **Updated**: [count] documents updated
⚠️ **Attention Needed**: [count] documents requiring manual review
🚨 **Critical Gaps**: [count] major discrepancies found

## Changes Applied

### 📄 Specifications Updated
- **requirements.md**: [changes made]
- **architecture.md**: [changes made]  
- **apis/[file].md**: [changes made]

### 🔗 Contracts Updated
- **api/[contract].md**: [changes made]
- **data/[contract].md**: [changes made]
- **security/[contract].md**: [changes made]

### 🆕 New Documentation
- [New files created]
- [New sections added]

## Gap Analysis

### ⚠️ Implementation vs Specification
- **Code Ahead**: [Features implemented but not documented]
- **Spec Ahead**: [Documented features not yet implemented]
- **Misaligned**: [Discrepancies between code and docs]

### 🔍 Critical Findings
1. **[Finding 1]**: [Description and impact]
   - Code location: project/[path]:line
   - Documentation: specs/[file]:section
   - Recommended action: [action needed]

2. **[Finding 2]**: [Description and impact]
   - [Details and recommendations]

## Contract Impact Assessment

### 📈 Contract Updates Needed
- **[Contract Name]**: [Update required]
  - Version: [current] → [new]
  - Breaking Changes: [Yes/No]
  - Migration Required: [Yes/No]

### 🔗 Dependency Chain Impact
- Affected Roles: [roles that consume updated contracts]
- Migration Timeline: [recommended timeline]
- Coordination Required: [cross-role coordination needs]

## Quality Validation

### 🧪 QA Impact
- Test specifications requiring updates
- Test cases invalidated by changes
- New testing requirements identified

### 🛡️ Security Review
- Security documentation alignment
- New security requirements from code changes
- Compliance impact assessment

## Recommendations

🔥 **Immediate Actions**:
1. [Urgent synchronization task]
2. [Critical gap to address]

📅 **Next Steps**:
1. [Follow-up documentation work]
2. [Stakeholder review requirements]
3. [Contract migration planning]

## Automated Sync Opportunities
[Suggestions for automated documentation generation]

---

✅ **Sync Complete**
Documentation synchronized with codebase as of [timestamp]
Next sync recommended: [timeframe]
```

Update session state with sync results and any new tasks identified during synchronization.