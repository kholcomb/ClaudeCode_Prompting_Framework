---
allowed-tools: Read(*), Write(*), Edit(*), MultiEdit(*), Bash(cd project && *), Grep(*), Glob(*)
description: Documentation synchronization and help for @project/
---

# Documentation Command

## Context

- Project specifications: @specs/ directory
- Project source code: @project/src/ directory
- Project tests: @project/tests/ directory
- Project documentation: @project/docs/ directory
- Project configuration: @project/config/ directory
- Recent changes: !`cd project && git log --oneline -5 2>/dev/null || echo "No git repository"`

## Your Task

Handle all documentation tasks for @project/:

**IMPORTANT**: Documentation must stay synchronized with @project/ implementation:

1. **Code-Documentation Sync**: Ensure @project/docs/ reflects @project/src/ implementation
2. **Requirements Alignment**: Validate @project/docs/ aligns with @specs/ directory
3. **Gap Detection**: If @project/ has undocumented features, ask user:
   "Found implemented features in @project/ not documented. Should I update @project/docs/ and @specs/ to include [specific features found]?"

### Documentation Types:

1. **Sync Documentation**: Update @project/docs/ to match @project/src/ implementation
2. **API Documentation**: Document APIs and interfaces in @project/
3. **User Documentation**: Create user guides for @project/ features
4. **Developer Documentation**: Document @project/ development processes
5. **Help and Guidance**: Provide help for @project/ development

## Usage Patterns

### Documentation Sync

`/docs sync`
`/docs update api-documentation`
`/docs validate consistency`

### Create Documentation

`/docs create user-guide`
`/docs generate api-docs`
`/docs write developer-setup`

### Help and Reference

`/docs help commands`
`/docs help project-structure`
`/docs help development-workflow`

## Response Format

```text
📚 Documentation: [Task]
Project Location: @project/
Documentation Target: @project/docs/
Generated: [timestamp]

## Sync Status
✅ @project/docs/ synchronized with @project/src/
⚠️ Documentation gaps identified: [details]
❌ Major inconsistencies found: [explanation]

## Documentation Analysis

### 📁 Current Documentation (@project/docs/)
- Files present: [count and list]
- Last updated: [recent activity]
- Coverage: [assessment of completeness]
- Quality: [assessment of documentation quality]

### 📋 Implementation Coverage
- @project/src/ features documented: [percentage]
- @project/tests/ procedures documented: [percentage]
- @project/config/ setup documented: [percentage]
- Undocumented features: [list of gaps]

## Documentation Updates

### ✅ Completed Updates
- [Updated document 1]: [changes made]
- [Updated document 2]: [changes made]

### 📝 New Documentation Created
- @project/docs/[new-file]: [purpose and content]
- @project/docs/[new-file]: [purpose and content]

### ⚠️ Attention Needed
- [Document needing review]: [issue description]
- [Missing documentation]: [what needs to be created]

## API Documentation

### 📡 Endpoints Documented
- [Endpoint 1]: @project/docs/[api-file]
- [Endpoint 2]: @project/docs/[api-file]

### 🔄 Updated API Docs
- [API change 1]: Updated in @project/docs/[file]
- [API change 2]: Updated in @project/docs/[file]

## User Documentation

### 📖 User Guides
- Setup Guide: @project/docs/[setup-file]
- User Manual: @project/docs/[user-file]
- FAQ: @project/docs/[faq-file]

### 🎯 Usage Examples
- [Feature 1]: Examples in @project/docs/[example-file]
- [Feature 2]: Examples in @project/docs/[example-file]

## Developer Documentation

### 🔧 Development Docs
- Architecture: @project/docs/[architecture-file]
- Contributing: @project/docs/[contributing-file]
- Testing: @project/docs/[testing-file]

### 📋 Process Documentation
- Development Workflow: @project/docs/[workflow-file]
- Code Standards: @project/docs/[standards-file]
- Deployment: @project/docs/[deployment-file]

## Help Information

### 🚀 Quick Start
[Brief quick start guide for @project/]

### 🏗️ Project Structure
```
@project/
├── src/           [source code organization]
├── tests/         [testing structure]
├── docs/          [documentation structure]
└── config/        [configuration files]
```

### 💡 Common Tasks
- [Common task 1]: [how to accomplish in @project/]
- [Common task 2]: [how to accomplish in @project/]
- [Common task 3]: [how to accomplish in @project/]

## Recommendations

### 🔥 Immediate Actions
1. [Priority documentation task for @project/]
2. [Critical doc update needed for @project/]

### 📅 Ongoing Maintenance
1. [Regular doc maintenance for @project/]
2. [Process improvement for @project/ docs]

**Next Documentation Review**: [Recommended timeframe]
```

All documentation work focuses on @project/ and maintains alignment with @specs/ requirements.