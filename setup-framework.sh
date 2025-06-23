#!/bin/bash
# Multi-Persona Development Framework Setup Script
# Version: 1.3.0
# Purpose: Initialize framework structure with optional configuration
# Can be run locally or from remote URL

set -e

# Remote setup capability
REPO_URL="https://raw.githubusercontent.com/kholcomb/ClaudeCode_Prompting_Framework/refs/heads/main"
TEMP_DIR=""

# Cleanup function for remote setup
cleanup_remote() {
    if [[ -n "$TEMP_DIR" ]] && [[ -d "$TEMP_DIR" ]]; then
        rm -rf "$TEMP_DIR"
    fi
}

# Download and setup from remote repository
setup_from_remote() {
    print_header "\n🌐 Remote Setup Mode"
    print_info "Downloading framework from GitHub..."
    
    # Create temporary directory
    TEMP_DIR=$(mktemp -d)
    trap cleanup_remote EXIT
    
    # Check for download tools
    if command -v curl &> /dev/null; then
        DOWNLOAD_CMD="curl -fsSL"
    elif command -v wget &> /dev/null; then
        DOWNLOAD_CMD="wget -qO-"
    else
        print_error "Neither curl nor wget is available"
        print_info "Please install curl or wget and try again"
        exit 1
    fi
    
    # Download essential files
    local files_to_download=(
        "CLAUDE.md"
        "VERSION"
        "README.md"
        "SECURITY.md"
        "LICENSE"
        "CHANGELOG.md"
        ".gitignore"
        "specs/requirements.md"
        "specs/project-plan.md"
        "specs/architecture.md"
        "specs/constraints.md"
        "specs/dependencies.md"
        "templates/CLAUDE.md"
        "templates/api-contract-template.md"
        "templates/feature-spec-template.md"
        "templates/persona-coordination-template.md"
        "templates/status-report-template.md"
        "templates/task-template.md"
        "artifacts/contracts/api/CLAUDE.md"
        "artifacts/contracts/data/CLAUDE.md"
        "artifacts/contracts/infrastructure/CLAUDE.md"
        "artifacts/contracts/security/CLAUDE.md"
        "artifacts/contracts/testing/CLAUDE.md"
        "artifacts/deliverables/CLAUDE.md"
        "logs/CLAUDE.md"
        "project/README.md"
    )
    
    print_info "Downloading framework files..."
    for file in "${files_to_download[@]}"; do
        local dir=$(dirname "$file")
        mkdir -p "$dir"
        
        if $DOWNLOAD_CMD "$REPO_URL/$file" > "$file" 2>/dev/null; then
            echo "  ✓ $file"
        else
            print_warning "Failed to download $file (may not exist in remote)"
        fi
    done
    
    # Download GitHub workflow templates
    mkdir -p templates/github-workflows
    local workflow_files=(
        "templates/github-workflows/README.md"
        "templates/github-workflows/framework-ci.yml"
        "templates/github-workflows/node-api-ci.yml"
        "templates/github-workflows/python-fastapi-ci.yml"
        "templates/github-workflows/react-ci.yml"
    )
    
    for file in "${workflow_files[@]}"; do
        if $DOWNLOAD_CMD "$REPO_URL/$file" > "$file" 2>/dev/null; then
            echo "  ✓ $file"
        fi
    done
    
    # Download and setup session state template as active session file
    print_info "Setting up session state..."
    mkdir -p logs
    if $DOWNLOAD_CMD "$REPO_URL/logs/session-state.json.template" > "logs/session-state.json" 2>/dev/null; then
        echo "  ✓ logs/session-state.json (from template)"
    else
        print_warning "Failed to download session state template"
    fi
    
    print_success "Framework files downloaded successfully"
    
    # Continue with normal setup
    print_info "Proceeding with framework initialization..."
}

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
NC='\033[0m' # No Color

# Framework version
if [[ -f VERSION ]]; then
    FRAMEWORK_VERSION=$(cat VERSION)
else
    print_warning "VERSION file not found, using default version 1.3.0"
    FRAMEWORK_VERSION="1.3.0"
fi

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

# Check if running from framework root or detect remote setup
check_framework_root() {
    # If running remotely, skip this check
    if [[ "$1" == "--remote" ]]; then
        return 0
    fi
    
    if [[ ! -f "CLAUDE.md" ]] || [[ ! -f "VERSION" ]]; then
        print_error "This script must be run from the framework root directory"
        print_info "Please navigate to the multi_agent_prompting_framework_template directory"
        print_info "Or use remote setup: curl -fsSL $REPO_URL/setup-framework.sh | bash -s -- --remote"
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
    mkdir -p .claude/commands
    
    print_success "Directory structure created"
}

# Create Claude Code command templates
create_claude_commands() {
    print_header "\n⚡ Creating Claude Code Commands"
    
    # Create /think command
    cat > .claude/commands/think.md << 'EOF'
# Think Command

## Description
Engage structured reasoning mode for complex decisions and analysis.

## Usage
`/think <question or problem>`

## Behavior
- Break down complex problems systematically
- Show step-by-step reasoning
- Consider multiple perspectives
- Identify assumptions and constraints
- Provide clear conclusions with rationale

## Examples
- `/think How should we architect this microservice?`
- `/think What are the tradeoffs between these two approaches?`
- `/think What could go wrong with this implementation?`
EOF

    # Create /efficient command
    cat > .claude/commands/efficient.md << 'EOF'
# Efficient Command

## Description
Switch to token-optimized response mode for long sessions.

## Usage
`/efficient` or `/efficient <task>`

## Behavior
- Compress responses to essential information
- Use concise language and bullet points
- Minimize explanatory text
- Focus on actionable outcomes
- Preserve accuracy while reducing verbosity

## When to Use
- Long coding sessions approaching context limits
- Repetitive tasks with established patterns
- When you need rapid iteration cycles
- Large codebases with many file operations

## Examples
- `/efficient` (switches mode for subsequent responses)
- `/efficient implement these 5 similar functions`
EOF

    # Create persona command templates
    for persona in pm architect frontend backend qa devops security cloud; do
        case $persona in
            pm)
                persona_name="Project Manager"
                workflow="coordinate → plan → track → communicate"
                ;;
            architect)
                persona_name="Architect"
                workflow="explore → design → validate → document"
                ;;
            frontend)
                persona_name="Frontend Developer"
                workflow="explore → plan → code → commit"
                ;;
            backend)
                persona_name="Backend Developer"
                workflow="explore → plan → code → commit"
                ;;
            qa)
                persona_name="QA Engineer"
                workflow="write tests → validate → iterate → commit"
                ;;
            devops)
                persona_name="DevOps Engineer"
                workflow="assess → configure → deploy → monitor"
                ;;
            security)
                persona_name="Security Engineer"
                workflow="audit → identify → mitigate → validate"
                ;;
            cloud)
                persona_name="Cloud Engineer"
                workflow="analyze → architect → provision → optimize"
                ;;
        esac
        
        cat > .claude/commands/${persona}.md << EOF
# ${persona_name} Command

## Description
Activate ${persona_name} persona with specialized workflow and expertise.

## Usage
\`/${persona} <task or question>\`

## Workflow
${workflow}

## Behavior
- Operate within ${persona_name} domain expertise
- Follow structured workflow appropriate to role
- Coordinate with other personas when needed
- Maintain role-specific documentation and artifacts
- Use specialized tools and patterns for the role

## Examples
- \`/${persona} analyze the current system architecture\`
- \`/${persona} plan the implementation approach\`
- \`/${persona} review and provide feedback\`
EOF
    done
    
    print_success "Claude Code commands created"
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
        "created_at": "$(date -u +%Y-%m-%dT%H:%M:%SZ 2>/dev/null || date +%Y-%m-%dT%H:%M:%S%z 2>/dev/null || date)",
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
required_dirs=("project" "specs" "artifacts" "logs" ".claude")
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
    create_claude_commands
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
    create_claude_commands
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
        if [[ -d "project" ]]; then
            cd project/ || { print_error "Failed to change to project/ directory"; exit 1; }
            git init
            echo "# Project" > README.md
            echo -e "node_modules/\n*.log\n.env\n.DS_Store\nsettings.local.json" > .gitignore
            git add .
            git commit -m "Initial project setup" || true
            cd .. || { print_error "Failed to return to framework root"; exit 1; }
            print_success "Git repository initialized"
        else
            print_error "project/ directory does not exist"
        fi
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
    echo "  ✓ Claude Code command templates (.claude/commands/)"
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
    if [[ "$1" == "--remote" ]]; then
        echo -e "${CYAN}Remote Setup Complete:${NC}"
        echo "  • Framework downloaded from: $REPO_URL"
        echo "  • Framework files installed and configured"
        echo "  • Consider adding this directory to version control"
    fi
    echo
    echo -e "${CYAN}Helper Scripts:${NC}"
    echo "  • Reset session: ${GREEN}./reset-session.sh${NC}"
    echo "  • Validate setup: ${GREEN}./validate-setup.sh${NC}"
    echo
    echo -e "${CYAN}Available Commands:${NC}"
    echo "  • ${GREEN}/think${NC} - Structured reasoning for complex decisions"
    echo "  • ${GREEN}/efficient${NC} - Token-optimized responses for long sessions"  
    echo "  • ${GREEN}/pm${NC} - Project Manager persona"
    echo "  • ${GREEN}/architect${NC} - System Architect persona"
    echo "  • ${GREEN}/frontend${NC} - Frontend Developer persona"
    echo "  • ${GREEN}/backend${NC} - Backend Developer persona"
    echo "  • ${GREEN}/qa${NC} - QA Engineer persona"
    echo "  • ${GREEN}/devops${NC} - DevOps Engineer persona"
    echo "  • ${GREEN}/security${NC} - Security Engineer persona"
    echo "  • ${GREEN}/cloud${NC} - Cloud Engineer persona"
    echo
    echo -e "${CYAN}Important:${NC}"
    echo "  • Always run Claude from the framework root"
    echo "  • Your project code goes in the project/ directory"
    echo "  • Specifications go in the specs/ directory"
    echo
}

# Main function
main() {
    local remote_mode="$1"
    
    show_banner
    
    # Handle remote setup
    if [[ "$remote_mode" == "--remote" ]]; then
        setup_from_remote
    fi
    
    check_framework_root "$remote_mode"
    check_dependencies
    
    # Check if already set up
    if [[ -f logs/session-state.json ]] && [[ -d artifacts/contracts ]]; then
        print_warning "Framework appears to be already set up"
        if [[ "$remote_mode" == "--remote" ]]; then
            print_info "Continuing with remote setup..."
        else
            read -p "$(echo -e "${CYAN}Continue anyway? [y/N]: ${NC}")" continue_setup
            if [[ "$(echo "$continue_setup" | tr '[:upper:]' '[:lower:]')" != "y" ]]; then
                print_info "Setup cancelled"
                exit 0
            fi
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
    if [[ -f "validate-setup.sh" ]] && [[ -x "validate-setup.sh" ]]; then
        ./validate-setup.sh
    else
        print_warning "validate-setup.sh not found or not executable, skipping validation"
    fi
    
    # Show completion
    show_completion
}

# Usage information
show_usage() {
    echo "Usage: $0 [--remote]"
    echo ""
    echo "Options:"
    echo "  --remote    Download and setup framework from GitHub"
    echo "  --help      Show this help message"
    echo ""
    echo "Remote usage:"
    echo "  curl -fsSL $REPO_URL/setup-framework.sh | bash -s -- --remote"
    echo "  wget -qO- $REPO_URL/setup-framework.sh | bash -s -- --remote"
}

# Handle command line arguments
case "${1:-}" in
    --help|-h)
        show_usage
        exit 0
        ;;
    --remote)
        # Validate we're in an empty or new directory for remote setup
        if [[ -f "CLAUDE.md" ]] && [[ ! "$PWD" =~ /tmp ]]; then
            print_warning "Framework files already exist in current directory"
            print_info "Remote setup is intended for new/empty directories"
            exit 1
        fi
        main "$@"
        ;;
    "")
        main "$@"
        ;;
    *)
        print_error "Unknown option: $1"
        show_usage
        exit 1
        ;;
esac