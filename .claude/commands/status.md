---
allowed-tools: Read(project/*), Bash(cd project && *), Glob(project/*), Grep(project/*)
description: Project status, progress tracking, and team overview for @project/
---

# Status Command

## Context

- Project specifications: @specs/ directory
- Project source code: @project/src/ directory
- Project tests: @project/tests/ directory
- Project documentation: @project/docs/ directory
- Project configuration: @project/config/ directory
- Git activity: !`cd project && git log --oneline --since="1 week ago" | wc -l`
- Recent commits: !`cd project && git log --oneline -5`

## Your Task

Provide comprehensive project status and progress tracking:

**IMPORTANT**: Status reports must reference actual project state:

1. **Requirements Tracking**: Compare current @project/ state with @specs/ requirements
2. **Progress Assessment**: Evaluate completion against specifications in @specs/
3. **Gap Analysis**: If @project/ has functionality not in @specs/, ask user:
   "Status check found implemented features not documented in @specs/. Should I update the specifications to include [specific features found]?"

### Status Types:

1. **Overall Progress**: High-level project completion status
2. **Development Status**: Current state of @project/src/ implementation
3. **Testing Status**: Coverage and quality metrics from @project/tests/
4. **Documentation Status**: Completeness of @project/docs/
5. **Team Status**: Role-based progress tracking

## Usage Patterns

### Overall Status

`/status`
`/status overview`
`/status progress`

### Specific Areas

`/status development`
`/status testing`
`/status documentation`
`/status deployment`

### Time-Based

`/status weekly`
`/status milestone`
`/status sprint`

## Response Format

```text
📈 Project Status Report
Generated: [timestamp]
Project Location: @project/
Specifications: @specs/

## Requirements Compliance
✅ [X]% of @specs/ requirements implemented in @project/
⚠️ [X] requirements partially implemented
❌ [X] requirements not yet started
📋 [X] implemented features not in @specs/ (require documentation)

## Development Progress

### 📁 Source Code (@project/src/)
- Total files: [count]
- Recently modified: [count] files in last week
- Code quality: [assessment based on structure]
- Architecture compliance: [alignment with @specs/]

### 🧪 Testing (@project/tests/)
- Test files: [count]
- Test coverage: [estimated based on file structure]
- Test status: [passing/failing/unknown]
- QA completeness: [assessment]

### 📖 Documentation (@project/docs/)
- Documentation files: [count]
- Completeness: [alignment with @project/src/]
- Last updated: [recent activity]
- User guides: [availability]

## Feature Implementation Status

### ✅ Completed Features
- [Feature 1]: Implemented in @project/src/[directory]/
- [Feature 2]: Implemented in @project/src/[directory]/

### 🔄 In Progress Features  
- [Feature 3]: Partial implementation in @project/src/[directory]/
- [Feature 4]: Started in @project/src/[directory]/

### 📋 Pending Features
- [Feature 5]: Specified in @specs/ but not started
- [Feature 6]: Specified in @specs/ but not started

## Quality Metrics

### 🏗️ Code Structure
- Organization: [assessment of @project/src/ structure]
- Conventions: [consistency across @project/]
- Maintainability: [code quality assessment]

### 🔒 Security Status
- Security implementations: [found in @project/]
- Vulnerability assessment: [basic security review]
- Compliance: [alignment with @specs/ security requirements]

### ⚡ Performance
- Performance considerations: [assessment from @project/]
- Optimization opportunities: [identified areas]
- Resource usage: [configuration assessment]

## Risk Assessment

### 🟢 Low Risk
- [Areas progressing well in @project/]

### 🟡 Medium Risk
- [Areas needing attention in @project/]
- **Mitigation**: [suggested actions]

### 🔴 High Risk
- [Critical issues in @project/]
- **Impact**: [potential consequences]
- **Action Required**: [immediate steps needed]

## Recommendations

### 🔥 Immediate Actions
1. [Priority task for @project/]
2. [Critical fix needed in @project/]

### 📅 Short-term Goals
1. [Next milestone for @project/]
2. [Process improvement for @project/]

### 🚀 Long-term Vision
1. [Strategic enhancement for @project/]
2. [Scalability consideration for @project/]

**Next Status Check**: [Recommended timeframe]
```

All status tracking focuses on @project/ directory progress against @specs/ requirements.