---
allowed-tools: Read(*)
description: Display comprehensive help for all available project commands
---

# Multi-Agent Framework Help

## Context
- Framework overview: @CLAUDE.md
- Available commands in: @.claude/commands/
- Team structure and capabilities

## Your Task
Provide comprehensive help documentation for the multi-agent framework:

1. **Command Reference**: Complete list of all available commands
2. **Usage Examples**: Practical examples for each command
3. **Workflow Guidance**: How commands fit into role workflows
4. **Best Practices**: Recommended usage patterns
5. **Getting Started**: Quick start guide for new users

## Response Format
```
❓ Multi-Agent Development Framework Help
Framework Version: [version if applicable]
Generated: [timestamp]

## 🚀 Quick Start

### First Time Setup
1. **Review Team Structure**: Use `/project:list-roles` to see available roles
2. **Check Project Status**: Use `/project:status` to understand current state
3. **Assign Initial Work**: Use `/project:assign [role] [task]` to delegate tasks
4. **Save Progress**: Use `/project:session save` to preserve work

### Common Workflow
```
/project:assign architect design-user-auth
/project:code user-authentication
/project:review auth-implementation
/project:status
/project:session save
```

## 📁 Available Commands

### Core Workflow Commands

#### `/project:assign [role] [task]`
**Purpose**: Assign a specific task to a team role
**Usage**: `/project:assign backend implement-user-api`
**Example**: `/project:assign frontend create-login-component`
**Output**: Structured task assignment with dependencies and deliverables
**Best Practice**: Be specific about the task and provide context

#### `/project:status`
**Purpose**: Get current project status across all roles
**Usage**: `/project:status`
**Output**: Comprehensive status report with progress, blockers, and metrics
**Best Practice**: Run regularly to maintain visibility into project health

#### `/project:summary`
**Purpose**: High-level project progress overview
**Usage**: `/project:summary`
**Output**: Executive summary with key metrics and accomplishments
**Best Practice**: Use for stakeholder communication and milestone reporting

### Quality & Review Commands

#### `/project:review [artifact]`
**Purpose**: Request comprehensive review of code, docs, or artifacts
**Usage**: `/project:review user-authentication-api`
**Example**: `/project:review project/src/auth/login.js`
**Output**: Multi-role review with quality assessment and recommendations
**Best Practice**: Review before major integrations or releases

#### `/project:feedback [role|all] [topic]`
**Purpose**: Get honest feedback and recommendations from specific role(s)
**Usage**: `/project:feedback security current-auth-approach`
**Example**: `/project:feedback all performance-optimization`
**Output**: Candid assessment with risks, recommendations, and alternatives
**Best Practice**: Use when facing technical decisions or seeking input

### Communication & Coordination Commands

#### `/project:meeting [topic]`
**Purpose**: Facilitate cross-role team meeting on specific topic
**Usage**: `/project:meeting api-design-review`
**Example**: `/project:meeting security-architecture-decisions`
**Output**: Structured meeting with role perspectives and action items
**Best Practice**: Use for complex decisions requiring multiple role input

### Development Commands

#### `/project:code [feature]`
**Purpose**: Generate code implementation for specific features
**Usage**: `/project:code jwt-authentication`
**Example**: `/project:code user-registration-form`
**Output**: Production-ready code with tests, documentation, and integration
**Best Practice**: Provide clear feature requirements and context

#### `/project:expand [topic]`
**Purpose**: Deep dive technical exploration of specific topics
**Usage**: `/project:expand microservices-architecture`
**Example**: `/project:expand oauth2-security-implementation`
**Output**: Comprehensive analysis with multi-role perspectives and recommendations
**Best Practice**: Use for complex technical decisions requiring thorough analysis

### State Management Commands

#### `/project:session [save|load|clear]`
**Purpose**: Manage session state and work continuity
**Usage**: `/project:session save`
**Examples**: 
- `/project:session save` - Save current progress
- `/project:session load` - Restore previous session
- `/project:session clear` - Start fresh
**Output**: Session management confirmation with continuation guidance
**Best Practice**: Save frequently, especially before major changes

#### `/project:checkpoint`
**Purpose**: Create progress snapshot with rollback capability
**Usage**: `/project:checkpoint`
**Output**: Comprehensive checkpoint with rollback procedures
**Best Practice**: Create before major releases or risky changes

#### `/project:sync`
**Purpose**: Synchronize documentation with code changes
**Usage**: `/project:sync`
**Output**: Documentation sync report with gap analysis and updates
**Best Practice**: Run after significant code changes to maintain doc accuracy

#### `/project:end-session`
**Purpose**: Comprehensive session closure with continuation prompts
**Usage**: `/project:end-session`
**Output**: Role-specific status and detailed continuation instructions
**Best Practice**: Use at end of work sessions for smooth resumption

### Administrative Commands

#### `/project:add-role [role] [reason]`
**Purpose**: Dynamically add specialized role to team
**Usage**: `/project:add-role data-engineer need-specialized-analytics`
**Example**: `/project:add-role mobile-developer ios-app-requirement`
**Output**: New role definition with workflow and integration plan
**Best Practice**: Justify need clearly and consider team dynamics

#### `/project:list-roles`
**Purpose**: Display all active team roles and their status
**Usage**: `/project:list-roles`
**Output**: Comprehensive team overview with capabilities and workload
**Best Practice**: Use to understand team composition and identify gaps

#### `/project:help`
**Purpose**: Display this comprehensive help information
**Usage**: `/project:help`
**Output**: Complete command reference and usage guide
**Best Practice**: Reference when learning new commands or workflows

## 📈 Team Roles Overview

### Available Roles
- **📋 Project Manager**: Coordination, planning, tracking
- **🏢 Architect**: System design, technical patterns
- **🎨 Frontend Developer**: UI/UX implementation
- **⚙️ Backend Developer**: Server-side logic, APIs
- **🧪 QA Engineer**: Testing, quality assurance
- **🚀 DevOps Engineer**: Infrastructure, deployment
- **🛡️ Security Engineer**: Security, compliance
- **☁️ Cloud Engineer**: Scalability, cloud optimization

### Role Workflows
- **PM**: `coordinate → plan → track → communicate`
- **Architect**: `explore → design → validate → document`
- **Frontend/Backend**: `explore → plan → code → commit`
- **QA**: `write tests → validate → iterate → commit`
- **DevOps**: `assess → configure → deploy → monitor`
- **Security**: `audit → identify → mitigate → validate`
- **Cloud**: `analyze → architect → provision → optimize`

## 🏆 Best Practices

### Workflow Optimization
1. **Start with Planning**: Use `/project:assign` for clear task delegation
2. **Regular Check-ins**: Run `/project:status` frequently for visibility
3. **Quality Gates**: Use `/project:review` before major integrations
4. **Documentation Sync**: Run `/project:sync` after code changes
5. **Session Management**: Save state with `/project:session save` regularly

### Effective Communication
1. **Be Specific**: Provide clear, detailed task descriptions
2. **Use Meetings Wisely**: `/project:meeting` for complex decisions only
3. **Seek Feedback**: Use `/project:feedback` for technical guidance
4. **Document Decisions**: Capture outcomes in session state

### Quality Assurance
1. **Review Early**: Don't wait until completion to review work
2. **Multi-Role Reviews**: Get perspective from relevant roles
3. **Test Continuously**: QA role should be involved throughout development
4. **Monitor Dependencies**: Track cross-role dependencies actively

### Project Management
1. **Parallel Work**: Identify opportunities for concurrent execution
2. **Resource Balance**: Monitor workload distribution across roles
3. **Risk Management**: Address blockers and dependencies proactively
4. **Progress Tracking**: Use checkpoints for major milestones

## 🔧 Troubleshooting

### Common Issues

#### "Role seems blocked or unresponsive"
**Solution**: 
1. Check `/project:status` for dependencies
2. Use `/project:feedback [role] current-blockers`
3. Consider `/project:meeting blocker-resolution`

#### "Work seems disconnected between roles"
**Solution**:
1. Run `/project:sync` to align documentation
2. Review interface contracts in artifacts/contracts/
3. Use `/project:meeting integration-alignment`

#### "Unclear what to do next"
**Solution**:
1. Check `/project:status` for current priorities
2. Review session state with `/project:session load`
3. Get guidance with `/project:feedback pm next-priorities`

#### "Quality issues or conflicts between roles"
**Solution**:
1. Use `/project:review` for quality assessment
2. Get multi-role perspective with `/project:feedback all [issue]`
3. Escalate with `/project:meeting conflict-resolution`

### Getting Help
- **Command Usage**: Use `/project:help` for reference
- **Role Questions**: Use `/project:feedback [role] [question]`
- **Process Issues**: Use `/project:meeting process-improvement`
- **Status Confusion**: Use `/project:status` for current state

## 📅 Example Workflows

### Starting a New Feature
```
1. /project:assign architect design-feature-x
2. /project:assign frontend plan-feature-x-ui
3. /project:assign backend plan-feature-x-api
4. /project:meeting feature-x-coordination
5. /project:code feature-x-implementation
6. /project:review feature-x
7. /project:session save
```

### Quality Review Process
```
1. /project:review [component-name]
2. /project:feedback qa testing-strategy
3. /project:assign qa test-[component]
4. /project:feedback security security-review
5. /project:meeting quality-gate-review
```

### Release Preparation
```
1. /project:sync
2. /project:checkpoint
3. /project:review release-candidate
4. /project:feedback devops deployment-readiness
5. /project:meeting release-go-no-go
6. /project:summary
```

---

✅ **Help Complete**
For specific command details, try the command with sample parameters.
For role-specific guidance, use `/project:feedback [role] [your-question]`
For team coordination, use `/project:meeting [topic]`
```

This help system provides comprehensive guidance while encouraging exploration and learning through practical usage.