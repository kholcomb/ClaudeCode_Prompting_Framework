#!/bin/bash
# Multi-Persona Development Framework Setup Script
# Script Version: 1.6.0
# Purpose: Download and setup the complete framework from GitHub

set -e

# Repository configuration
REPO_ARCHIVE_URL="https://github.com/kholcomb/ClaudeCode_Prompting_Framework/archive/refs/heads/main.tar.gz"
REPO_RAW_URL="https://raw.githubusercontent.com/kholcomb/ClaudeCode_Prompting_Framework/refs/heads/main"

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
NC='\033[0m' # No Color

# Print colored output
print_info() { echo -e "${BLUE}ℹ️  $1${NC}"; }
print_success() { echo -e "${GREEN}✅ $1${NC}"; }
print_warning() { echo -e "${YELLOW}⚠️  $1${NC}"; }
print_error() { echo -e "${RED}❌ $1${NC}"; }
print_header() { echo -e "${PURPLE}$1${NC}"; }

# ASCII Art Banner
show_banner() {
    echo -e "${CYAN}"
    cat << 'EOF'
 _____ _____ _____ _____ _____ 
|   __|   __|_   _|  |  |  _  |
|__   |   __| | | |  |  |   __|
|_____|_____| |_| |_____|__|   
                                
Multi-Persona Framework Setup
=============================
EOF
    echo -e "${NC}"
}

# Check dependencies
check_dependencies() {
    print_header "\n📋 Checking Dependencies"
    
    local missing_deps=()
    
    # Check for curl or wget (required for download)
    if ! command -v curl &> /dev/null && ! command -v wget &> /dev/null; then
        missing_deps+=("curl or wget")
    else
        if command -v curl &> /dev/null; then
            print_success "curl is available"
        elif command -v wget &> /dev/null; then
            print_success "wget is available"
        fi
    fi
    
    # Check Claude Code (optional)
    if ! command -v claude &> /dev/null; then
        print_warning "Claude Code not found in PATH"
        print_info "You can still use this framework with claude.ai"
        print_info "For Claude Code: https://docs.anthropic.com/en/docs/claude-code"
    else
        print_success "Claude Code is available"
    fi
    
    # Exit if missing required dependencies
    if [ ${#missing_deps[@]} -gt 0 ]; then
        print_error "Missing required dependencies: ${missing_deps[*]}"
        print_info "Please install the missing dependencies and try again"
        exit 1
    fi
}

# Download the framework
setup_framework() {
    print_header "\n🌐 Setting up framework from GitHub"
    
    # Determine download command
    if command -v curl &> /dev/null; then
        DOWNLOAD_CMD="curl -L"
    else
        DOWNLOAD_CMD="wget -O-"
    fi
    
    print_info "Downloading framework archive..."
    if $DOWNLOAD_CMD "$REPO_ARCHIVE_URL" | tar -xz --strip-components=1 2>/dev/null; then
        print_success "Framework downloaded and extracted successfully"
    else
        print_error "Failed to download framework"
        exit 1
    fi
}

# Initialize session state with worktree support
init_session_state() {
    print_header "\n🔧 Initializing session state with worktree support"
    
    # Use the comprehensive session state template
    if [[ -f "logs/session-state.json.template" ]]; then
        print_info "Using comprehensive session state template..."
        cp logs/session-state.json.template logs/session-state.json
        
        # Update session-specific values
        local session_id=$(uuidgen 2>/dev/null || date +%s)
        local timestamp=$(date -u +%Y-%m-%dT%H:%M:%SZ 2>/dev/null || date)
        local version=$(cat VERSION 2>/dev/null || echo "1.6.0")
        
        # Update session info in the copied file
        if command -v sed &> /dev/null; then
            sed -i.bak "s/\"session-template\"/\"$session_id\"/" logs/session-state.json
            sed -i.bak "s/\"2024-01-01T00:00:00Z\"/\"$timestamp\"/g" logs/session-state.json
            sed -i.bak "s/\"template\"/\"active\"/" logs/session-state.json
            sed -i.bak "s/\"1.2.0\"/\"$version\"/g" logs/session-state.json
            sed -i.bak "s/\"planning\"/\"initialization\"/" logs/session-state.json
            rm -f logs/session-state.json.bak
        fi
        
        print_success "Advanced session state initialized with worktree and sub-agent support"
    else
        print_warning "Template not found, creating basic session state..."
        # Fallback to basic session state
        cat > logs/session-state.json << EOF
{
    "session_info": {
        "session_id": "$(uuidgen 2>/dev/null || date +%s)",
        "created_at": "$(date -u +%Y-%m-%dT%H:%M:%SZ 2>/dev/null || date)",
        "framework_version": "$(cat VERSION 2>/dev/null || echo "1.6.0")",
        "current_phase": "initialization"
    },
    "personas": {
        "project_manager": {"status": "idle", "current_workflow_stage": "coordinate"},
        "architect": {"status": "idle", "current_workflow_stage": "explore"},
        "frontend_developer": {"status": "idle", "current_workflow_stage": "explore"},
        "backend_developer": {"status": "idle", "current_workflow_stage": "explore"},
        "qa_engineer": {"status": "idle", "current_workflow_stage": "write_tests"},
        "devops_engineer": {"status": "idle", "current_workflow_stage": "assess"},
        "security_engineer": {"status": "idle", "current_workflow_stage": "audit"},
        "cloud_engineer": {"status": "idle", "current_workflow_stage": "analyze"}
    },
    "worktree_management": {
        "enabled": true,
        "active_worktrees": {},
        "shared_coordination": {
            "message_queue_path": "worktrees/shared-state/coordination.json",
            "last_sync": null,
            "coordination_protocol": "message_queue"
        }
    },
    "contracts": {
        "active": [],
        "draft": [],
        "deprecated": []
    },
    "context_management": {
        "mode": "normal",
        "context_usage_estimate": "low"
    },
    "git_context": {
        "branch": "main",
        "modified_files": [],
        "last_commit": ""
    },
    "progress": {
        "overall_completion": 0,
        "current_milestone": "Framework Setup"
    }
}
EOF
        print_success "Basic session state initialized with worktree support"
    fi
}

# Optional project setup
setup_project() {
    print_header "\n📦 Project Setup (Optional)"
    
    read -p "$(echo -e "${CYAN}Initialize git repository in project/ directory? [y/N]: ${NC}")" init_project_git
    
    if [[ "$(echo "$init_project_git" | tr '[:upper:]' '[:lower:]')" == "y" ]]; then
        cd project/ || { print_error "Failed to enter project directory"; return; }
        
        if git init; then
            print_success "Git repository initialized in project/"
            
            # Create initial commit if there are files
            if [ -n "$(ls -A 2>/dev/null)" ]; then
                git add .
                git commit -m "Initial project setup" 2>/dev/null || true
            fi
        else
            print_warning "Failed to initialize git in project/"
        fi
        
        cd .. || { print_error "Failed to return to root directory"; return; }
    fi
}

# Show completion message
show_completion() {
    echo
    print_header "🎉 Framework Setup Complete!"
    echo
    echo -e "${CYAN}What's been installed:${NC}"
    echo "  ✓ Complete framework directory structure"
    echo "  ✓ All framework files and templates"
    echo "  ✓ Claude Code command templates (.claude/commands/)"
    echo "  ✓ Git worktree management system"
    echo "  ✓ Sub-agent delegation framework"
    echo "  ✓ Session state configuration with worktree support"
    echo "  ✓ Documentation and specifications"
    echo
    echo -e "${CYAN}Directory Structure:${NC}"
    echo "  📁 project/     - Your project code goes here"
    echo "  📁 specs/       - Project specifications"
    echo "  📁 artifacts/   - Development artifacts"
    echo "  📁 logs/        - Session logs and state"
    echo "  📁 templates/   - Reusable templates"
    echo "  📁 .claude/     - Claude Code commands"
    echo "  📁 worktrees/   - Git worktree management for parallel development"
    echo
    echo -e "${CYAN}Next Steps:${NC}"
    echo "  1. Start Claude Code from this directory:"
    echo -e "     ${GREEN}claude${NC}"
    echo "  2. Begin with a simple request like:"
    echo "     \"Help me understand this framework\""
    echo "     \"Let's plan a new project\""
    echo
    echo -e "${CYAN}Available Commands:${NC}"
    echo -e "  • ${GREEN}/help${NC} - Display comprehensive framework help"
    echo -e "  • ${GREEN}/status${NC} - View project status and progress"
    echo -e "  • ${GREEN}/dev${NC} - Start development workflow"
    echo -e "  • ${GREEN}/plan${NC} - Create project plans"
    echo -e "  • ${GREEN}/project:worktree${NC} - Git worktree management for parallel development"
    echo "  • And many more - use /help for full list"
    echo
    echo -e "${CYAN}Important:${NC}"
    echo "  • Always run Claude from the framework root directory"
    echo "  • Your project code goes in the project/ directory"
    echo "  • Use worktrees for parallel development: /project:worktree action=create"
    echo "  • Sub-agents can be spawned for complex task subdivision"
    echo "  • Framework updates: Re-run setup script for latest version"
    echo
}

# Validate setup
validate_setup() {
    print_header "\n🔍 Validating installation"
    
    local errors=0
    
    # Check essential directories
    local essential_dirs=("project" "specs" "artifacts" "logs" ".claude" "templates" "worktrees")
    for dir in "${essential_dirs[@]}"; do
        if [[ -d "$dir" ]]; then
            echo "  ✓ $dir/"
        else
            echo "  ✗ Missing: $dir/"
            ((errors++))
        fi
    done
    
    # Check essential files
    local essential_files=("CLAUDE.md" "VERSION" "README.md" "logs/session-state.json" "worktrees/shared-state/coordination.json" ".claude/commands/worktree.md")
    for file in "${essential_files[@]}"; do
        if [[ -f "$file" ]]; then
            echo "  ✓ $file"
        else
            echo "  ✗ Missing: $file"
            ((errors++))
        fi
    done
    
    if [[ $errors -eq 0 ]]; then
        print_success "All essential components installed successfully!"
        return 0
    else
        print_error "Installation validation failed with $errors errors"
        return 1
    fi
}

# Main setup flow
main() {
    show_banner
    
    # Check dependencies
    check_dependencies
    
    # Setup framework from GitHub
    setup_framework
    
    # Initialize session state
    init_session_state
    
    # Optional project setup
    setup_project
    
    # Validate installation
    if validate_setup; then
        show_completion
    else
        print_error "Setup completed with errors. Please check the installation."
        exit 1
    fi
}

# Show usage
show_usage() {
    echo "Usage: $0 [--help]"
    echo ""
    echo "This script sets up the Multi-Persona Development Framework by:"
    echo "  • Downloading the complete framework from GitHub"
    echo "  • Initializing session state"
    echo "  • Optionally setting up project git repository"
    echo ""
    echo "Requirements:"
    echo "  • curl or wget"
    echo ""
    echo "For remote execution:"
    echo "  curl -fsSL $REPO_RAW_URL/setup-framework.sh | bash"
    echo "  wget -qO- $REPO_RAW_URL/setup-framework.sh | bash"
}

# Handle command line arguments
case "${1:-}" in
    --help|-h)
        show_usage
        exit 0
        ;;
    "")
        main
        ;;
    *)
        print_error "Unknown option: $1"
        show_usage
        exit 1
        ;;
esac