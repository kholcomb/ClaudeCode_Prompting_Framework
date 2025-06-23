---
allowed-tools: Read(project/*), Grep(project/*), Glob(project/*), Bash(cd project && *)
description: Code review, quality assessment, and feedback for @project/ artifacts
---

# Review Command

## Context

- Project specifications: @specs/ directory
- Project source code: @project/src/ directory
- Project tests: @project/tests/ directory
- Project documentation: @project/docs/ directory
- Git changes: !`cd project && git diff --name-only HEAD~1`
- Test results: !`cd project && npm test --silent 2>/dev/null || echo "No tests configured"`

## Your Task

Conduct thorough reviews of project artifacts with multi-role perspectives:

**IMPORTANT**: All reviews must validate against project requirements:

1. **Requirements Compliance**: Verify @project/ code aligns with @specs/ directory
2. **Architecture Alignment**: Ensure @project/ structure follows architectural guidelines in @specs/
3. **Specification Gaps**: If reviewing something not covered in @specs/, ask user:
   "This review identified functionality not specified in @specs/. Should I update the specifications to document [specific functionality found]?"

### Review Types:

1. **Code Review**: Analyze @project/src/ implementations
2. **Quality Assessment**: Evaluate @project/ code against standards
3. **Test Review**: Validate @project/tests/ coverage and quality
4. **Documentation Review**: Check @project/docs/ accuracy and completeness
5. **Architecture Review**: Assess @project/ structure and patterns

## Usage Patterns

### Code Review

`/review src/components/LoginForm.js`
`/review api/auth/`
`/review recent-changes`

### Feature Review

`/review user-authentication-feature`
`/review dashboard-implementation`
`/review payment-integration`

### Quality Assessment

`/review code-quality`
`/review test-coverage`
`/review security-audit`

## Response Format

```text
🔍 Review: [Target]
Location: @project/[directory-path]/
Reviewers: [Primary Role] + [Supporting Roles]
Date: [timestamp]

## Requirements Validation
✅ Complies with specifications in @specs/
⚠️ Partially complies, gaps identified: [details]
❌ Does not comply with specifications: [explanation]

## Code Analysis
📍 **Directories Reviewed**:
- @project/src/[directory]/ - [assessment]
- @project/tests/[directory]/ - [assessment]
- @project/docs/[directory]/ - [assessment]

## Quality Assessment

### ✅ Strengths
- [Positive findings in @project/ code]
- [Well-implemented patterns]
- [Good practices observed]

### ⚠️ Improvements Needed
- @project/src/[directory]/ - [specific issue]
- @project/tests/[directory]/ - [test improvement needed]
- @project/docs/[directory]/ - [documentation gap]

### 🚨 Critical Issues
- @project/src/[directory]/ - [critical problem]
- [Security vulnerabilities in @project/]
- [Performance bottlenecks in @project/]

## Multi-Role Perspectives

### 🎨 Frontend Review
[UI/UX considerations for @project/src/components/]

### ⚙️ Backend Review  
[API and logic assessment for @project/src/api/]

### 🧪 QA Review
[Test quality and coverage for @project/tests/]

### 🛡️ Security Review
[Security implications across @project/]

## Recommendations
1. **Immediate**: [Critical fixes needed in @project/]
2. **Short-term**: [Improvements for @project/ structure]
3. **Long-term**: [Architectural enhancements for @project/]

## Approval Status
[✅ Approved | ⚠️ Approved with Conditions | ❌ Needs Revision]

**Next Steps**: [Specific actions for @project/ directories]
```

All review activities focus exclusively on the @project/ directory structure and validate against @specs/ requirements.