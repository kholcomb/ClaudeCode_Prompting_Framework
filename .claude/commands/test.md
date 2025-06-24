---
allowed-tools: Read(project/*), Write(project/*), Edit(project/*), Bash(cd project && *), Grep(project/*), Glob(project/*)
description: QA and testing workflows for @project/
---

# Testing Command

## Context

- Project specifications: @specs/ directory
- Project source code: @project/src/ directory
- Project tests: @project/tests/ directory
- Project documentation: @project/docs/ directory
- Test results: !`cd project && npm test --silent 2>/dev/null || echo "No test framework configured"`
- Coverage info: !`cd project && npm run coverage --silent 2>/dev/null || echo "No coverage configured"`

## Your Task

Handle all testing and QA activities for @project/:

**IMPORTANT**: Testing must validate against project requirements:

1. **Requirements Testing**: Ensure @project/tests/ validate @specs/ requirements
2. **Coverage Analysis**: Verify @project/tests/ cover @project/src/ implementation
3. **Gap Identification**: If @project/src/ has untested features, ask user:
   "Found untested functionality in @project/src/. Should I create tests in @project/tests/ for [specific features found]?"

### Testing Types:

1. **Unit Testing**: Test individual components in @project/src/
2. **Integration Testing**: Test component interactions in @project/
3. **End-to-End Testing**: Test complete workflows in @project/
4. **Performance Testing**: Test @project/ performance characteristics
5. **Security Testing**: Test @project/ security implementations

## Usage Patterns

### Test Creation

`/test create unit LoginComponent`
`/test add integration user-auth-flow`
`/test write e2e complete-user-journey`

### Test Execution

`/test run all`
`/test run unit`
`/test check coverage`

### Quality Assessment

`/test review quality`
`/test analyze gaps`
`/test validate requirements`

## Response Format

```text
🧪 Testing: [Task]
Project Location: @project/
Test Directory: @project/tests/
Generated: [timestamp]

## Requirements Coverage
✅ [X]% of @specs/ requirements have tests in @project/tests/
⚠️ [X] requirements partially tested
❌ [X] requirements not tested
📋 [X] implemented features in @project/src/ need tests

## Test Analysis

### 📁 Current Test Suite (@project/tests/)
- Test files: [count and structure]
- Test frameworks: [detected frameworks]
- Last test run: [status and timestamp]
- Coverage: [estimated coverage percentage]

### 🎯 Test Coverage by Area
- @project/src/components/: [coverage assessment]
- @project/src/api/: [coverage assessment]
- @project/src/utils/: [coverage assessment]
- @project/config/: [coverage assessment]

## Test Results

### ✅ Passing Tests
- Unit tests: [X]/[Y] passing
- Integration tests: [X]/[Y] passing
- E2E tests: [X]/[Y] passing

### ❌ Failing Tests
- [Test name]: [failure reason]
- [Test name]: [failure reason]

### ⚠️ Test Issues
- [Issue 1]: [description and location]
- [Issue 2]: [description and location]

## Test Implementation

### 🆕 New Tests Created
- @project/tests/[test-file]: [purpose and coverage]
- @project/tests/[test-file]: [purpose and coverage]

### 🔄 Updated Tests
- @project/tests/[test-file]: [changes made]
- @project/tests/[test-file]: [changes made]

## Quality Metrics

### 📊 Code Coverage
- Line coverage: [percentage]
- Branch coverage: [percentage]
- Function coverage: [percentage]
- Statement coverage: [percentage]

### 🏗️ Test Quality
- Test completeness: [assessment]
- Test maintainability: [assessment]
- Test reliability: [assessment]
- Test performance: [assessment]

## Testing Strategy

### 🎯 Testing Priorities
1. **Critical Path**: [most important @project/ functionality to test]
2. **High Risk**: [areas in @project/ that need thorough testing]
3. **User Workflows**: [key user scenarios to validate]

### 🔧 Test Improvements
- [Improvement 1]: [specific enhancement for @project/tests/]
- [Improvement 2]: [specific enhancement for @project/tests/]

## Security Testing

### 🛡️ Security Test Results
- Authentication tests: [status]
- Authorization tests: [status]
- Input validation tests: [status]
- Security vulnerability tests: [status]

## Performance Testing

### ⚡ Performance Test Results
- Load testing: [results for @project/]
- Stress testing: [results for @project/]
- Performance benchmarks: [key metrics]

## Recommendations

### 🔥 Immediate Actions
1. [Priority test task for @project/]
2. [Critical test fix needed for @project/]

### 📅 Test Maintenance
1. [Regular test maintenance for @project/]
2. [Test process improvement for @project/]

### 🚀 Future Testing
1. [Enhanced testing strategy for @project/]
2. [Additional test types for @project/]

**Next Test Review**: [Recommended timeframe]
```

All testing activities focus on @project/ implementation and validate against @specs/ requirements.