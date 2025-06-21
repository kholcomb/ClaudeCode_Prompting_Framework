# Multi-Agent Development Team Framework

A prompt engineering template that enables Claude Code to assist with software development through specialized team roles, providing structured workflows and organized project management.

## Table of Contents

- [Overview](#overview)
- [Key Features](#key-features)
- [Architecture & Design](#architecture--design)
- [Getting Started](#getting-started)
- [Team Roles & Workflows](#team-roles--workflows)
- [Framework Components](#framework-components)
- [Usage Examples](#usage-examples)
- [Best Practices](#best-practices)
- [Advanced Features](#advanced-features)
- [Troubleshooting](#troubleshooting)

## Overview

This framework is a **prompt engineering template** designed to enhance how Claude Code assists with software development projects. By providing structured instructions in CLAUDE.md, it enables Claude to operate with role-based expertise, similar to working with a specialized development team.

### What This Framework Is

- **A directory structure template** with organized folders for specifications, artifacts, and project code
- **A comprehensive CLAUDE.md file** that instructs Claude Code on role-based development workflows
- **A session management approach** for maintaining context across Claude Code interactions
- **A methodology** for organizing complex development projects with AI assistance

### What This Framework Is NOT

- Not standalone software or an application
- Not an automated system that runs independently
- Not a replacement for actual development tools
- Commands mentioned (like `/pm`, `/architect`) are conceptual - actual usage depends on Claude Code's features

### Why Use This Framework?

- **Specialized Responses**: Claude adopts specific expertise based on the active role
- **Structured Workflows**: Each role follows defined processes for consistency
- **Organized Development**: Clear separation of concerns across different aspects
- **Context Persistence**: Session state helps maintain continuity across interactions
- **Better Documentation**: Structured approach to maintaining project documentation

## Key Features

### Role-Based Development
- 8 specialized roles covering all aspects of modern software development
- Each role follows specific workflows optimized for their responsibilities
- Clear handoffs and contract-based communication between roles

### Intelligent Assistance
- Claude identifies opportunities for concurrent task development
- Structured contracts for component interfaces
- Clear documentation of assumptions and decisions
- Session state tracking for context continuity

### Quality Focus
- Quality checkpoints defined in each role's workflow
- Testing strategies incorporated into development process
- Code review considerations built into role behaviors
- Security and performance awareness in relevant roles

### Documentation Structure
- Organized specifications in dedicated directories
- Contract templates for consistent API documentation
- Architecture documentation guidelines
- Clear structure for requirements tracking

## Framework Structure

### Directory Layout

```
multi_agent_prompting_framework_template/
├── README.md                    # This file
├── CLAUDE.md                    # Framework configuration and instructions
├── artifacts/                   # Generated artifacts and contracts
│   ├── contracts/              # Interface contracts between components
│   │   ├── api/               # API contracts
│   │   ├── data/              # Data model contracts
│   │   ├── infrastructure/    # Infrastructure contracts
│   │   ├── security/          # Security contracts
│   │   └── testing/           # Testing contracts
│   └── deliverables/          # Completed project deliverables
├── logs/                       # Session management and logging
│   ├── session-state.json     # Current session state
│   ├── archive/              # Historical session logs
│   └── checkpoints/          # Session recovery points
├── project/                   # Actual project code
│   ├── src/                  # Source code
│   ├── tests/                # Test suites
│   ├── docs/                 # Project documentation
│   └── config/               # Configuration files
├── specs/                     # Project specifications
│   ├── architecture.md       # System architecture
│   ├── requirements.md       # Project requirements
│   ├── constraints.md        # Technical constraints
│   ├── dependencies.md       # External dependencies
│   ├── project-plan.md       # Project planning
│   ├── apis/                 # API specifications
│   └── design/               # Design documents
└── templates/                 # Reusable document templates
    ├── api-contract-template.md
    ├── feature-spec-template.md
    └── status-report-template.md
```

### Workflow Architecture

```
┌─────────────────────────────────────────────────────────────┐
│                    Project Manager                          │
│              (Coordinate → Plan → Track)                    │
└─────────────────┬───────────────────┬─────────────────────┘
                  │                   │
     ┌────────────▼────────┐ ┌───────▼────────┐
     │     Architect       │ │   QA Engineer   │
     │ (Explore → Design)  │ │ (Test → Validate)│
     └────────┬────────────┘ └────────┬────────┘
              │                       │
    ┌─────────▼─────────┬────────────▼──────────┐
    │ Frontend Dev     │    Backend Dev        │
    │ (Plan → Code)    │    (Plan → Code)      │
    └──────────────────┴───────────┬────────────┘
                                   │
                ┌──────────────────▼────────────────┐
                │        DevOps/Security/Cloud      │
                │    (Configure → Deploy → Monitor)  │
                └───────────────────────────────────┘
```

### Contract Management System

The framework uses a contract-based communication system:

1. **Contract Lifecycle**: Draft → Active → Deprecated → Archived
2. **Contract Types**: API, Data, Infrastructure, Security, Testing
3. **Version Control**: Semantic versioning with migration support
4. **Dependency Resolution**: Contracts consumed at workflow checkpoints

## Getting Started

### Prerequisites

- Claude Code (or Claude.ai) access
- Basic understanding of software development workflows
- A project idea or existing codebase to work with

### Quick Start

1. **Set up the framework**:
   ```bash
   # Clone or download this template
   git clone <repository-url> my-project-name
   cd my-project-name
   
   # Or create the directory structure manually
   ```

2. **Customize for your project**:
   - Update `specs/requirements.md` with your project requirements
   - Modify `specs/project-plan.md` with your timeline and milestones
   - Adjust `CLAUDE.md` if you need different role behaviors
   - Place existing code in the `project/` directory

3. **Start using with Claude Code**:
   - Open the framework directory in your terminal
   - Start Claude Code from the framework root directory
   - The CLAUDE.md instructions will guide Claude's behavior
   - Claude will maintain session context in `logs/session-state.json`

### Using the Framework

The framework guides Claude's responses based on the CLAUDE.md instructions. You can:

- **Request specific roles**: "As the architect, design the system architecture"
- **Ask for role-specific help**: "Can the QA engineer create a test strategy?"
- **Switch between roles**: "Now as the frontend developer, implement the UI"
- **Get status updates**: "What's the current project status?"
- **Hold team meetings**: "Let's have a team meeting to discuss the API design"

*Note: Specific command syntax depends on your Claude Code version and configuration.*

## Team Roles & Workflows

### Project Manager
**Workflow**: `coordinate → plan → track → communicate`

Responsibilities:
- Break down complex work into manageable tasks
- Coordinate team capacity and dependencies
- Monitor progress and identify blockers
- Facilitate cross-role collaboration
- Maintain project timeline and milestones

### Architect
**Workflow**: `explore → design → validate → document`

Responsibilities:
- Research system requirements and constraints
- Design system architecture and patterns
- Create data models and API contracts
- Validate designs with implementation teams
- Maintain architectural documentation

### Frontend Developer
**Workflow**: `explore → plan → code → commit`

Responsibilities:
- Analyze UI/UX requirements
- Design component architecture
- Implement responsive interfaces
- Handle client-side state management
- Ensure accessibility and performance

### Backend Developer
**Workflow**: `explore → plan → code → commit`

Responsibilities:
- Design APIs and database schemas
- Implement business logic
- Handle authentication and authorization
- Optimize database queries
- Maintain API documentation

### QA Engineer
**Workflow**: `write tests → validate → iterate → commit`

Responsibilities:
- Create comprehensive test strategies
- Implement automated testing
- Execute testing protocols
- Validate requirements compliance
- Maintain quality metrics

### DevOps Engineer
**Workflow**: `assess → configure → deploy → monitor`

Responsibilities:
- Design CI/CD pipelines
- Configure environments
- Execute deployments
- Monitor system performance
- Maintain infrastructure documentation

### Security Engineer
**Workflow**: `audit → identify → mitigate → validate`

Responsibilities:
- Conduct security audits
- Identify vulnerabilities
- Implement security controls
- Validate security measures
- Maintain compliance documentation

### Cloud Engineer
**Workflow**: `analyze → architect → provision → optimize`

Responsibilities:
- Analyze scalability requirements
- Design cloud infrastructure
- Provision cloud resources
- Optimize cost and performance
- Monitor resource utilization

## Framework Components

### Session State Management

The framework maintains persistent state in `logs/session-state.json`:

```json
{
  "session_info": {
    "session_id": "unique-session-id",
    "project_name": "My Project",
    "current_phase": "development"
  },
  "roles": {
    "project_manager": {
      "status": "active",
      "current_workflow_stage": "track",
      "active_tasks": ["Task 1", "Task 2"],
      "completed_tasks": ["Task 0"]
    }
  },
  "contracts": {
    "active": ["api-v1.0.0", "data-models-v1.0.0"]
  },
  "progress": {
    "overall_completion": 35,
    "current_milestone": "MVP Development"
  }
}
```

### Contract Management

Contracts define interfaces between system components:

1. **API Contracts**: RESTful/GraphQL endpoint specifications
2. **Data Contracts**: Shared data model definitions
3. **Infrastructure Contracts**: Deployment and scaling requirements
4. **Security Contracts**: Authentication and authorization specifications
5. **Testing Contracts**: Test coverage and quality requirements

### Quality Assurance Integration

Quality checkpoints are built into each workflow:

- Code review before commits
- Automated testing requirements
- Documentation updates with code changes
- Security validation for sensitive changes
- Performance testing for critical paths

## Usage Examples

### Example 1: Starting a New Project

```
Human: I need to build a task management application with user authentication, 
real-time updates, and mobile support.

Claude: I'll help coordinate the development of your task management application.
Operating as the Project Manager, let me break this down into phases:

[Claude creates a project plan in specs/project-plan.md]
[Updates session-state.json with project information]

Now, as the Architect, I'll design the system architecture. Let me explore 
the requirements and create the foundational design...

[Claude creates architecture documents and API contracts]
```

### Example 2: Implementing a Feature

```
Human: As the frontend developer, implement the task creation form

Claude: As the Frontend Developer, I'll implement the task creation form. 
First, let me check the API contract for the task creation endpoint...

[Claude reviews contracts in artifacts/contracts/api/]
[Implements component in project/src/]
[Creates tests in project/tests/]
[Updates session state with progress]
```

### Example 3: Setting Up Infrastructure

```
Human: We need a DevOps engineer to set up the CI/CD pipeline

Claude: As the DevOps Engineer, I'll set up a comprehensive CI/CD pipeline. 
Let me assess the project structure and requirements...

[Claude creates pipeline configuration in project/config/]
[Documents deployment process in docs/]
[Updates infrastructure contracts in artifacts/]
```

## Best Practices

### Role Selection
- Use PM role for planning and coordination
- Activate specific roles for implementation tasks
- Switch to meeting mode for cross-role decisions
- Let roles work independently when possible

### Parallelization Strategies
- Identify independent work streams
- Use contracts to define interfaces early
- Document assumptions for validation
- Minimize blocking dependencies

### Session Management
- Commit work regularly to preserve state
- Use checkpoints before major changes
- Review session state when resuming work
- Clear completed tasks to maintain focus

### Documentation
- Keep specifications up to date
- Use templates for consistency
- Link code changes to documentation
- Maintain traceability throughout development

## Customization

### Adapting the Framework

1. **Custom Workflows**: Modify `CLAUDE.md` to change role behaviors and workflows
2. **New Roles**: Add additional specialized roles as needed
3. **Contract Types**: Create new contract templates for your domain
4. **Project Structure**: Adjust directories to match your preferences

### Best Practices for Customization

- Keep CLAUDE.md instructions clear and specific
- Maintain consistency in role workflows
- Document any custom additions
- Test changes with sample interactions

## Troubleshooting

### Common Scenarios

**Starting Fresh**
- Copy the template to a new directory
- Clear or reset `session-state.json`
- Update project specifications

**Continuing Work**
- Claude reads session state automatically
- Provide context about what changed
- Ask for status updates to sync understanding

**Switching Contexts**
- Be explicit about role changes
- Save important decisions in specs/
- Update contracts when interfaces change

### Getting Help

- Review CLAUDE.md for detailed instructions
- Check templates/ for examples
- Examine existing contracts for patterns
- Use /help commands for role-specific guidance

---

## Contributing

This framework is designed to evolve with your development practices:

1. Customize workflows in CLAUDE.md
2. Add new templates as needed
3. Extend contract types for your domain
4. Share improvements with the community

## License

[Your License Here]

---

*The Multi-Agent Development Team Framework - A prompt engineering template for structured, role-based development assistance with Claude Code.*