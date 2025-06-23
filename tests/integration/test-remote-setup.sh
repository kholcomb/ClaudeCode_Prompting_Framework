#!/bin/bash
# Integration Test Plan for PR#8: Remote Setup Capability
# Tests the remote setup functionality added to setup-framework.sh

set -e

# Test configuration
TEST_DIR=$(mktemp -d)
REPO_URL="https://raw.githubusercontent.com/kholcomb/ClaudeCode_Prompting_Framework/refs/heads/feature/remote-setup-capability"
SCRIPT_URL="$REPO_URL/setup-framework.sh"

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m'

# Test utilities
test_passed=0
test_failed=0

print_test() { echo -e "${BLUE}🧪 TEST: $1${NC}"; }
print_pass() { echo -e "${GREEN}✅ PASS: $1${NC}"; ((test_passed++)); }
print_fail() { echo -e "${RED}❌ FAIL: $1${NC}"; ((test_failed++)); }
print_skip() { echo -e "${YELLOW}⏭️  SKIP: $1${NC}"; }
print_info() { echo -e "${BLUE}ℹ️  INFO: $1${NC}"; }

# Cleanup function
cleanup() {
    if [[ -d "$TEST_DIR" ]]; then
        rm -rf "$TEST_DIR"
    fi
}
trap cleanup EXIT

# Test summary
print_summary() {
    echo
    echo "=================================="
    echo "TEST SUMMARY"
    echo "=================================="
    echo "Passed: $test_passed"
    echo "Failed: $test_failed"
    echo "Total:  $((test_passed + test_failed))"
    echo
    if [[ $test_failed -eq 0 ]]; then
        echo -e "${GREEN}🎉 ALL TESTS PASSED${NC}"
        exit 0
    else
        echo -e "${RED}💥 SOME TESTS FAILED${NC}"
        exit 1
    fi
}

# Test 1: Verify download tools are available
test_download_tools() {
    print_test "Download tools availability"
    
    if command -v curl &> /dev/null; then
        print_pass "curl is available"
    elif command -v wget &> /dev/null; then
        print_pass "wget is available"
    else
        print_fail "Neither curl nor wget is available"
        return 1
    fi
}

# Test 2: Download and validate setup script
test_script_download() {
    print_test "Script download from remote URL"
    
    cd "$TEST_DIR"
    
    if command -v curl &> /dev/null; then
        if curl -fsSL "$SCRIPT_URL" -o setup-framework.sh; then
            print_pass "Successfully downloaded script with curl"
        else
            print_fail "Failed to download script with curl"
            return 1
        fi
    elif command -v wget &> /dev/null; then
        if wget -qO setup-framework.sh "$SCRIPT_URL"; then
            print_pass "Successfully downloaded script with wget"
        else
            print_fail "Failed to download script with wget"
            return 1
        fi
    fi
    
    # Verify script is executable and contains expected content
    chmod +x setup-framework.sh
    
    if [[ -x setup-framework.sh ]]; then
        print_pass "Script is executable"
    else
        print_fail "Script is not executable"
        return 1
    fi
    
    if grep -q "setup_from_remote" setup-framework.sh; then
        print_pass "Script contains remote setup functionality"
    else
        print_fail "Script missing remote setup functionality"
        return 1
    fi
}

# Test 3: Test --help flag
test_help_flag() {
    print_test "Help flag functionality"
    
    cd "$TEST_DIR"
    
    if ./setup-framework.sh --help > help_output.txt 2>&1; then
        if grep -q "remote" help_output.txt && grep -q "curl" help_output.txt; then
            print_pass "Help output contains remote setup information"
        else
            print_fail "Help output missing remote setup information"
            cat help_output.txt
            return 1
        fi
    else
        print_fail "Help flag failed to execute"
        return 1
    fi
}

# Test 4: Test remote setup in clean directory
test_remote_setup_clean() {
    print_test "Remote setup in clean directory"
    
    local clean_dir=$(mktemp -d)
    cd "$clean_dir"
    
    print_info "Testing remote setup in: $clean_dir"
    
    # Download and run setup script with --remote flag
    if command -v curl &> /dev/null; then
        download_cmd="curl -fsSL"
    else
        download_cmd="wget -qO-"
    fi
    
    # Test the actual remote setup command
    if echo 'q' | $download_cmd "$SCRIPT_URL" | bash -s -- --remote > setup_output.txt 2>&1; then
        print_pass "Remote setup executed successfully"
        
        # Verify expected files were created
        expected_files=(
            "CLAUDE.md"
            "VERSION"
            "README.md"
            "logs/session-state.json"
            "reset-session.sh"
            "validate-setup.sh"
        )
        
        for file in "${expected_files[@]}"; do
            if [[ -f "$file" ]]; then
                print_pass "Created expected file: $file"
            else
                print_fail "Missing expected file: $file"
            fi
        done
        
        # Verify expected directories were created
        expected_dirs=(
            "project"
            "specs"
            "artifacts"
            "templates"
            ".claude/commands"
        )
        
        for dir in "${expected_dirs[@]}"; do
            if [[ -d "$dir" ]]; then
                print_pass "Created expected directory: $dir"
            else
                print_fail "Missing expected directory: $dir"
            fi
        done
        
    else
        print_fail "Remote setup failed to execute"
        if [[ -f setup_output.txt ]]; then
            echo "Setup output:"
            cat setup_output.txt
        fi
        return 1
    fi
    
    # Cleanup
    rm -rf "$clean_dir"
}

# Test 5: Test safety check - existing framework detection
test_existing_framework_protection() {
    print_test "Existing framework protection"
    
    local existing_dir=$(mktemp -d)
    cd "$existing_dir"
    
    # Create a fake CLAUDE.md to simulate existing framework
    echo "# Fake Framework" > CLAUDE.md
    
    print_info "Testing protection in directory with existing framework files"
    
    # Try to run remote setup - should fail
    if echo 'q' | bash "$TEST_DIR/setup-framework.sh" --remote > protection_output.txt 2>&1; then
        print_fail "Remote setup should have been blocked but executed anyway"
        cat protection_output.txt
        return 1
    else
        if grep -q "already exist" protection_output.txt; then
            print_pass "Remote setup correctly blocked existing framework"
        else
            print_fail "Remote setup blocked but with wrong message"
            cat protection_output.txt
            return 1
        fi
    fi
    
    # Cleanup
    rm -rf "$existing_dir"
}

# Test 6: Test invalid arguments
test_invalid_arguments() {
    print_test "Invalid argument handling"
    
    cd "$TEST_DIR"
    
    # Test invalid flag
    if ./setup-framework.sh --invalid > invalid_output.txt 2>&1; then
        print_fail "Script should have failed with invalid argument"
        return 1
    else
        if grep -q "Unknown option" invalid_output.txt; then
            print_pass "Script correctly rejects invalid arguments"
        else
            print_fail "Script failed but with wrong error message"
            cat invalid_output.txt
            return 1
        fi
    fi
}

# Test 7: Test cross-platform date command fallback
test_date_fallback() {
    print_test "Cross-platform date command fallback"
    
    cd "$TEST_DIR"
    
    # Check if the script contains the enhanced date fallback
    if grep -q "date +%Y-%m-%dT%H:%M:%S%z" setup-framework.sh; then
        print_pass "Script contains enhanced date command fallback"
    else
        print_fail "Script missing enhanced date command fallback"
        return 1
    fi
}

# Test 8: Test directory change error handling
test_directory_safety() {
    print_test "Directory change error handling"
    
    cd "$TEST_DIR"
    
    # Check if the script contains proper directory change validation
    if grep -q "cd project/ ||" setup-framework.sh; then
        print_pass "Script contains directory change error handling"
    else
        print_fail "Script missing directory change error handling"
        return 1
    fi
}

# Test 9: Test script validation before execution
test_script_validation() {
    print_test "Script existence validation"
    
    cd "$TEST_DIR"
    
    # Check if the script validates other scripts before execution
    if grep -q "\[\[ -f \"validate-setup.sh\" \]\]" setup-framework.sh; then
        print_pass "Script validates other scripts before execution"
    else
        print_fail "Script missing script validation checks"
        return 1
    fi
}

# Test 10: Test VERSION file handling
test_version_handling() {
    print_test "VERSION file handling improvements"
    
    cd "$TEST_DIR"
    
    # Check if the script contains improved VERSION file handling
    if grep -q "print_warning.*VERSION file not found" setup-framework.sh; then
        print_pass "Script contains improved VERSION file handling"
    else
        print_fail "Script missing improved VERSION file handling"
        return 1
    fi
}

# Main test execution
main() {
    echo "========================================"
    echo "PR#8 Remote Setup Capability Test Plan"
    echo "========================================"
    echo "Testing remote setup functionality"
    echo "Test directory: $TEST_DIR"
    echo "Repository URL: $REPO_URL"
    echo "========================================"
    echo
    
    # Run all tests
    test_download_tools
    test_script_download
    test_help_flag
    test_remote_setup_clean
    test_existing_framework_protection
    test_invalid_arguments
    test_date_fallback
    test_directory_safety
    test_script_validation
    test_version_handling
    
    # Print summary
    print_summary
}

# Execute main function
main "$@"