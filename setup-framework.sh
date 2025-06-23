#!/bin/bash
# Multi-Persona Development Framework Setup Script
# Version: 1.3.0
# Purpose: Initialize framework structure with optional configuration

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
NC='\033[0m' # No Color

# Framework version
FRAMEWORK_VERSION=$(cat VERSION 2>/dev/null || echo "1.3.0")

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

# Check if running from framework root
check_framework_root() {
    if [[ ! -f "CLAUDE.md" ]] || [[ ! -f "VERSION" ]]; then
        print_error "This script must be run from the framework root directory"
        print_info "Please navigate to the multi_agent_prompting_framework_template directory"
        exit 1
    fi
}

# Check basic dependencies
check_dependencies() {
    print_header "\n📋 Checking Dependencies"
    
    # Check git (required)
    if ! command -v git &> /dev/null; then
        print_error "Git is required but not installed"
        print_info "Please install git and run this script again"
        exit 1
    else
        print_success "Git is installed ($(git --version | cut -d' ' -f3))"
    fi
    
    # Check Claude Code (optional)
    if ! command -v claude &> /dev/null; then
        print_warning "Claude Code not found in PATH"
        print_info "You can still use this framework with claude.ai"
        print_info "For Claude Code: https://docs.anthropic.com/en/docs/claude-code"
    else
        print_success "Claude Code is available"
    fi
}

# Initialize directory structure
init_directories() {
    print_header "\n📁 Creating Directory Structure"
    
    # Create framework directories
    mkdir -p logs/{archive,checkpoints}
    mkdir -p artifacts/{contracts/{api,data,infrastructure,security,testing},deliverables}
    mkdir -p specs/{apis,design}
    mkdir -p project/{src,tests,docs,config}
    mkdir -p templates
    mkdir -p .vscode
    
    print_success "Directory structure created"
}

# Initialize session state
init_session_state() {
    local personas="$1"
    
    # Default to all personas if not specified
    if [[ -z "$personas" ]] || [[ "$personas" == "all" ]]; then
        personas_json='{
        "project_manager": {"status": "idle", "current_workflow_stage": "coordinate"},
        "architect": {"status": "idle", "current_workflow_stage": "explore"},
        "frontend_developer": {"status": "idle", "current_workflow_stage": "explore"},
        "backend_developer": {"status": "idle", "current_workflow_stage": "explore"},
        "qa_engineer": {"status": "idle", "current_workflow_stage": "write_tests"},
        "devops_engineer": {"status": "idle", "current_workflow_stage": "assess"},
        "security_engineer": {"status": "idle", "current_workflow_stage": "audit"},
        "cloud_engineer": {"status": "idle", "current_workflow_stage": "analyze"}
    }'
    else
        personas_json="$personas"
    fi
    
    # Add project info if provided
    local project_info=""
    if [[ -n "$PROJECT_NAME" ]]; then
        project_info="\"project_name\": \"$PROJECT_NAME\","
    fi
    
    cat > logs/session-state.json << EOF
{
    "session_info": {
        "session_id": "$(uuidgen 2>/dev/null || date +%s)",
        $project_info
        "created_at": "$(date -u +%Y-%m-%dT%H:%M:%SZ 2>/dev/null || date +%Y-%m-%dT%H:%M:%SZ)",
        "framework_version": "$FRAMEWORK_VERSION",
        "current_phase": "initialization"
    },
    "personas": $personas_json,
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
}

# Setup VS Code workspace
setup_vscode() {
    cat > .vscode/settings.json << 'EOF'
{
  "files.associations": {
    "CLAUDE.md": "markdown",
    "*.md": "markdown"
  },
  "markdown.preview.breaks": true,
  "files.exclude": {
    "**/node_modules": true,
    "**/__pycache__": true,
    "**/venv": true,
    "**/.env": true
  },
  "search.exclude": {
    "**/node_modules": true,
    "**/logs/archive": true,
    "**/.git": true
  },
  "git.ignoreLimitWarning": true
}
EOF

    cat > .vscode/extensions.json << 'EOF'
{
  "recommendations": [
    "yzhang.markdown-all-in-one",
    "davidanson.vscode-markdownlint"
  ]
}
EOF
}

# Create helper scripts
create_helper_scripts() {
    # Reset session script
    cat > reset-session.sh << 'EOF'
#!/bin/bash
# Reset session state for the Multi-Persona Framework

echo "🔄 Resetting session state..."

# Backup current session
if [[ -f logs/session-state.json ]]; then
    timestamp=$(date +%Y%m%d_%H%M%S)
    cp logs/session-state.json "logs/archive/session-state-$timestamp.json"
    echo "✅ Current session backed up to logs/archive/"
fi

# Reset to clean state
echo '{
    "session_info": {
        "session_id": "'$(uuidgen 2>/dev/null || date +%s)'",
        "created_at": "'$(date -u +%Y-%m-%dT%H:%M:%SZ 2>/dev/null || date +%Y-%m-%dT%H:%M:%SZ)'",
        "framework_version": "'$(cat VERSION 2>/dev/null || echo "1.3.0")'",
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
        "current_milestone": "Reset"
    }
}' > logs/session-state.json

echo "✅ Session state reset complete"
EOF
    chmod +x reset-session.sh
    
    # Validate setup script
    cat > validate-setup.sh << 'EOF'
#!/bin/bash
# Validate Multi-Persona Framework setup

echo "🔍 Validating framework setup..."

errors=0

# Check required files
required_files=("CLAUDE.md" "VERSION" "README.md" "logs/session-state.json")
for file in "${required_files[@]}"; do
    if [[ ! -f "$file" ]]; then
        echo "❌ Missing required file: $file"
        ((errors++))
    else
        echo "✅ Found: $file"
    fi
done

# Check required directories
required_dirs=("project" "specs" "artifacts" "logs")
for dir in "${required_dirs[@]}"; do
    if [[ ! -d "$dir" ]]; then
        echo "❌ Missing required directory: $dir"
        ((errors++))
    else
        echo "✅ Found: $dir/"
    fi
done

# Check optional directories
if [[ -d "templates" ]]; then
    echo "✅ Found: templates/"
else
    echo "ℹ️  No templates/ directory (optional)"
fi

# Check git setup
if [[ -d project/.git ]]; then
    echo "✅ Git repository initialized in project/"
else
    echo "ℹ️  No git repository in project/ (optional)"
fi

# Validate session state JSON
if command -v python3 &> /dev/null; then
    python3 -m json.tool logs/session-state.json > /dev/null 2>&1
    if [[ $? -eq 0 ]]; then
        echo "✅ Session state JSON is valid"
    else
        echo "❌ Session state JSON is invalid"
        ((errors++))
    fi
else
    echo "⚠️  Cannot validate JSON (python3 not found)"
fi

if [[ $errors -eq 0 ]]; then
    echo "✅ Framework setup is valid!"
else
    echo "❌ Found $errors issues with setup"
    exit 1
fi
EOF
    chmod +x validate-setup.sh
}

# Quick setup - minimal configuration
quick_setup() {
    print_header "\n⚡ Quick Setup Mode"
    print_info "Creating framework with default configuration..."
    
    init_directories
    init_session_state "all"
    setup_vscode
    create_helper_scripts
    
    print_success "Quick setup complete!"
}

# Custom setup - optional configuration
custom_setup() {
    print_header "\n🎨 Custom Setup Mode"
    print_info "Press Enter to use defaults or skip optional steps"
    echo
    
    # Optional: Project name
    print_info "Note: Project name will be saved to logs/session-state.json (excluded from git by default)"
    read -p "$(echo -e "${CYAN}Project name (optional, press Enter to skip): ${NC}")" PROJECT_NAME
    
    # Optional: Select personas
    echo
    print_info "Select personas to enable (optional)"
    echo "1) All personas (default)"
    echo "2) Project Manager + Architect only"
    echo "3) Custom selection"
    read -p "$(echo -e "${CYAN}Choice [1-3, press Enter for all]: ${NC}")" persona_choice
    
    personas_json=""
    case "${persona_choice:-1}" in
        2)
            personas_json='{
        "project_manager": {"status": "idle", "current_workflow_stage": "coordinate"},
        "architect": {"status": "idle", "current_workflow_stage": "explore"}
    }'
            ;;
        3)
            # Custom persona selection
            echo "Select personas (space-separated numbers):"
            echo "1) Project Manager  2) Architect  3) Frontend Dev  4) Backend Dev"
            echo "5) QA Engineer  6) DevOps  7) Security  8) Cloud Engineer"
            read -p "$(echo -e "${CYAN}Enter numbers (e.g., 1 2 5): ${NC}")" -a selections
            
            if [[ ${#selections[@]} -gt 0 ]]; then
                personas_json="{"
                for sel in "${selections[@]}"; do
                    case $sel in
                        1) personas_json+='"project_manager": {"status": "idle", "current_workflow_stage": "coordinate"},' ;;
                        2) personas_json+='"architect": {"status": "idle", "current_workflow_stage": "explore"},' ;;
                        3) personas_json+='"frontend_developer": {"status": "idle", "current_workflow_stage": "explore"},' ;;
                        4) personas_json+='"backend_developer": {"status": "idle", "current_workflow_stage": "explore"},' ;;
                        5) personas_json+='"qa_engineer": {"status": "idle", "current_workflow_stage": "write_tests"},' ;;
                        6) personas_json+='"devops_engineer": {"status": "idle", "current_workflow_stage": "assess"},' ;;
                        7) personas_json+='"security_engineer": {"status": "idle", "current_workflow_stage": "audit"},' ;;
                        8) personas_json+='"cloud_engineer": {"status": "idle", "current_workflow_stage": "analyze"},' ;;
                    esac
                done
                personas_json="${personas_json%,}}"
            fi
            ;;
    esac
    
    # Initialize directories and session
    init_directories
    init_session_state "$personas_json"
    
    # Optional: VS Code setup
    echo
    read -p "$(echo -e "${CYAN}Configure VS Code workspace? [Y/n]: ${NC}")" vscode_setup
    if [[ "$(echo "$vscode_setup" | tr '[:upper:]' '[:lower:]')" != "n" ]]; then
        setup_vscode
        print_success "VS Code configured"
    fi
    
    # Optional: Git setup
    echo
    read -p "$(echo -e "${CYAN}Initialize git in project/ directory? [y/N]: ${NC}")" git_setup
    if [[ "$(echo "$git_setup" | tr '[:upper:]' '[:lower:]')" == "y" ]]; then
        cd project/
        git init
        echo "# Project" > README.md
        echo -e "node_modules/\n*.log\n.env\n.DS_Store" > .gitignore
        git add .
        git commit -m "Initial project setup" || true
        cd ..
        print_success "Git repository initialized"
    fi
    
    create_helper_scripts
    
    print_success "Custom setup complete!"
}

# Show completion message
show_completion() {
    echo
    print_header "🎉 Framework Setup Complete!"
    echo
    echo -e "${CYAN}What's been created:${NC}"
    echo "  ✓ Framework directory structure"
    echo "  ✓ Session state configuration"
    echo "  ✓ Helper scripts (reset-session.sh, validate-setup.sh)"
    [[ -f .vscode/settings.json ]] && echo "  ✓ VS Code workspace configuration"
    [[ -d project/.git ]] && echo "  ✓ Git repository in project/"
    echo
    echo -e "${CYAN}Next Steps:${NC}"
    echo "  1. Start Claude Code from this directory:"
    echo "     ${GREEN}claude${NC}"
    echo "  2. Begin with a simple request like:"
    echo "     \"Help me understand this framework\""
    echo "     \"Let's plan a new project\""
    echo
    echo -e "${CYAN}Helper Scripts:${NC}"
    echo "  • Reset session: ${GREEN}./reset-session.sh${NC}"
    echo "  • Validate setup: ${GREEN}./validate-setup.sh${NC}"
    echo
    echo -e "${CYAN}Important:${NC}"
    echo "  • Always run Claude from the framework root"
    echo "  • Your project code goes in the project/ directory"
    echo "  • Specifications go in the specs/ directory"
    echo
}

# Main function
main() {
    show_banner
    check_framework_root
    check_dependencies
    
    # Check if already set up
    if [[ -f logs/session-state.json ]] && [[ -d artifacts/contracts ]]; then
        print_warning "Framework appears to be already set up"
        read -p "$(echo -e "${CYAN}Continue anyway? [y/N]: ${NC}")" continue_setup
        if [[ "$(echo "$continue_setup" | tr '[:upper:]' '[:lower:]')" != "y" ]]; then
            print_info "Setup cancelled"
            exit 0
        fi
    fi
    
    # Choose setup mode
    echo
    print_header "Setup Options:"
    echo "  ${GREEN}[Q]uick${NC} - Minimal setup with defaults (recommended)"
    echo "  ${BLUE}[C]ustom${NC} - Choose what to configure"
    echo "  ${RED}[E]xit${NC} - Cancel setup"
    echo
    read -p "$(echo -e "${CYAN}Select setup mode [Q/c/e]: ${NC}")" setup_mode
    
    case "$(echo "$setup_mode" | tr '[:upper:]' '[:lower:]')" in
        c|custom)
            custom_setup
            ;;
        e|exit)
            print_info "Setup cancelled"
            exit 0
            ;;
        *)
            quick_setup
            ;;
    esac
    
    # Validate setup
    echo
    ./validate-setup.sh
    
    # Show completion
    show_completion
}

# Run main function
main "$@"