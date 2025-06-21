---
allowed-tools: Read(*), Write(*), Edit(*), MultiEdit(*), Bash(*), Grep(*), Glob(*)
description: Generate code implementation for specific features
---

# Code Generation

## Context
- Feature specification: [specified in command]
- Project structure: @project/
- Architecture guidelines: @specs/architecture.md
- API contracts: @artifacts/contracts/api/
- Coding standards: @specs/constraints.md

## Your Task
Generate production-ready code for the specified feature:

1. **Role Determination**: Identify which role(s) should implement this feature
2. **Architecture Review**: Ensure alignment with system architecture
3. **Contract Compliance**: Follow relevant interface contracts
4. **Quality Standards**: Apply coding standards and best practices
5. **Integration Planning**: Consider integration points and dependencies

## Code Generation Process

### Analysis Phase
- Review existing codebase structure and patterns
- Identify integration points and dependencies
- Determine appropriate implementation approach
- Check for existing similar implementations

### Implementation Phase
- Generate code following established patterns
- Include proper error handling and validation
- Add appropriate logging and monitoring
- Include security considerations

### Quality Assurance
- Include unit tests for new functionality
- Add documentation and code comments
- Ensure compliance with coding standards
- Consider performance implications

## Response Format
```
💻 Code Generation: [Feature Name]
Implementing Role: [Primary role responsible]
Target Location: project/[path]/
Language/Framework: [technology stack]

## Implementation Plan

### 🏢 Architecture Alignment
- **Design Pattern**: [pattern being followed]
- **Integration Points**: [how this connects to existing system]
- **Dependencies**: [external dependencies or modules]
- **Contract Compliance**: [which contracts this implements/uses]

### 📝 Code Structure
- **Main Implementation**: [core functionality files]
- **Supporting Files**: [utilities, helpers, configs]
- **Test Files**: [test implementations]
- **Documentation**: [README, API docs, comments]

---

## 💻 Implementation Code

### [File 1: Main Implementation]
**File**: `project/[path]/[filename]`

```[language]
[Generated code implementation]
```

### [File 2: Supporting Module]
**File**: `project/[path]/[filename]`

```[language]
[Supporting code]
```

### [File 3: Test Implementation]
**File**: `project/[path]/[test-filename]`

```[language]
[Test code]
```

### [File 4: Configuration/Setup]
**File**: `project/[path]/[config-filename]`

```[language]
[Configuration code]
```

---

## 📝 Documentation

### API Documentation
[If applicable - API endpoints, parameters, responses]

### Usage Examples
```[language]
[Code examples showing how to use the feature]
```

### Integration Guide
[How other parts of the system can integrate with this feature]

## 🛡️ Security Considerations
- [Security measure 1]
- [Security measure 2]
- [Input validation approach]
- [Authorization/authentication handling]

## 📈 Performance Considerations
- [Performance optimization 1]
- [Scalability consideration]
- [Resource usage implications]

## 🧪 Quality Assurance

### Test Coverage
- **Unit Tests**: [test coverage areas]
- **Integration Tests**: [integration test scenarios]
- **Edge Cases**: [edge cases covered]

### Code Quality
- **Coding Standards**: [compliance confirmation]
- **Error Handling**: [error handling approach]
- **Logging**: [logging strategy]

## 🔗 Contract Updates

### Published Contracts
- **[Contract Name]**: [new contract published]
  - Version: [version number]
  - Consumers: [roles that will consume this]

### Updated Contracts
- **[Contract Name]**: [existing contract updated]
  - Changes: [what changed]
  - Migration: [migration requirements]

## 📅 Next Steps

🔥 **Immediate Actions**:
1. [Action 1] - [responsible role]
2. [Action 2] - [responsible role]

🔄 **Follow-up Tasks**:
1. [Task 1] - [timeline and role]
2. [Task 2] - [timeline and role]

🧪 **QA Requirements**:
- [Testing requirements]
- [Review requirements]
- [Validation requirements]

## 📊 Integration Impact

### Affected Systems
- [System 1]: [impact description]
- [System 2]: [impact description]

### Deployment Considerations
- [Deployment requirement 1]
- [Environment configuration needs]
- [Migration/rollback planning]

---

✅ **Code Generation Complete**
Feature: [Feature name] ready for review and testing
Next: Run /project:review [feature-name] for quality validation
```

Actually write the generated code to the appropriate files in the project directory and update relevant contracts.