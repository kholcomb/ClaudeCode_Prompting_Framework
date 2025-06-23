# Test Suite for Multi-Persona Development Framework

This directory contains tests for validating the framework functionality and ensuring quality across all components.

## Test Structure

```
tests/
├── README.md                    # This file - test documentation
├── integration/                 # Integration tests
│   └── test-remote-setup.sh    # PR#8 remote setup capability tests
├── unit/                       # Unit tests (future)
└── e2e/                        # End-to-end tests (future)
```

## Integration Tests

### test-remote-setup.sh

**Purpose**: Validate the remote setup capability added in PR#8

**Test Coverage**:
- [x] Download tool availability (curl/wget)
- [x] Script download from remote URL
- [x] Help flag functionality
- [x] Remote setup in clean directory
- [x] Existing framework protection
- [x] Invalid argument handling
- [x] Cross-platform date command fallback
- [x] Directory change error handling
- [x] Script validation before execution
- [x] VERSION file handling improvements

**Usage**:
```bash
# Run all PR#8 tests
./tests/integration/test-remote-setup.sh

# Test will create temporary directories and clean up automatically
```

**Requirements**:
- Network access to GitHub
- Either curl or wget installed
- Bash shell

**Expected Results**: All 10 test cases should pass, validating:
1. Remote download functionality works correctly
2. Safety checks prevent overwriting existing installations
3. Error handling is robust across different scenarios
4. Cross-platform compatibility improvements are effective

## Running Tests

### Individual Test Files
```bash
# Make test executable (if needed)
chmod +x tests/integration/test-remote-setup.sh

# Run specific test
./tests/integration/test-remote-setup.sh
```

### Future Test Categories

#### Unit Tests (Planned)
- Individual function validation
- Persona behavior testing
- Configuration parsing tests
- SDLC methodology validation

#### End-to-End Tests (Planned)
- Complete framework setup workflows
- Multi-persona coordination scenarios
- Project lifecycle testing
- Quality gate validation

## Test Development Guidelines

### Writing New Tests
1. Follow the naming convention: `test-{feature-name}.sh`
2. Include comprehensive error handling and cleanup
3. Use colored output for clear test results
4. Provide detailed test descriptions and expected outcomes
5. Include both positive and negative test cases

### Test Standards
- All tests should be idempotent (can run multiple times safely)
- Tests should clean up temporary files and directories
- Exit codes should indicate success (0) or failure (non-zero)
- Tests should be runnable in any order
- Include proper error messages for debugging failures

### Test Template Structure
```bash
#!/bin/bash
# Test description and purpose

set -e

# Configuration
TEST_DIR=$(mktemp -d)

# Colors and utilities
print_test() { echo -e "${BLUE}🧪 TEST: $1${NC}"; }
print_pass() { echo -e "${GREEN}✅ PASS: $1${NC}"; }
print_fail() { echo -e "${RED}❌ FAIL: $1${NC}"; }

# Cleanup function
cleanup() {
    rm -rf "$TEST_DIR"
}
trap cleanup EXIT

# Test functions
test_feature() {
    print_test "Feature description"
    # Test implementation
    if [[ condition ]]; then
        print_pass "Test passed"
    else
        print_fail "Test failed"
        return 1
    fi
}

# Main execution
main() {
    echo "Test Suite: [Name]"
    test_feature
    # Additional tests...
}

main "$@"
```

## Continuous Integration

Tests are designed to integrate with CI/CD pipelines:

### GitHub Actions Integration
```yaml
- name: Run Framework Tests
  run: |
    chmod +x tests/integration/*.sh
    ./tests/integration/test-remote-setup.sh
```

### Local Development
```bash
# Run all tests
find tests/ -name "*.sh" -exec chmod +x {} \; -exec {} \;

# Run specific test category
./tests/integration/test-remote-setup.sh
```

## Test Results and Reporting

Each test script provides:
- Colored output for immediate feedback
- Detailed test case descriptions
- Pass/fail counts and summary
- Exit codes for automation integration
- Cleanup of temporary resources

Expected output format:
```
🧪 TEST: Feature description
✅ PASS: Specific test case
❌ FAIL: Failed test case
==================================
TEST SUMMARY
==================================
Passed: 8
Failed: 2
Total:  10
```

## Contributing Tests

When adding new features to the framework:

1. **Create corresponding tests** in the appropriate test category
2. **Update this README** with test descriptions and usage
3. **Ensure tests pass** before submitting pull requests
4. **Include test validation** in PR descriptions

### PR Test Requirements

For each PR, include:
- Test plan covering new functionality
- Updated or new test scripts
- Validation that all existing tests still pass
- Documentation of any test environment requirements

This ensures the framework maintains high quality and reliability across all development workflows.