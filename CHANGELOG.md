# Changelog

All notable changes to the Multi-Persona Development Team Framework will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## Component Versioning

The framework consists of several major components that may be versioned independently:

| Component | Current Version | Description |
|-----------|----------------|-------------|
| Framework | 1.2.2 | Overall framework version |
| CLAUDE.md | 1.2.2 | Core framework instructions |
| Session State Schema | 1.2.0 | JSON structure for state management |
| Command Set | 1.1.0 | Available slash commands |
| Contract Protocol | 1.0.0 | Inter-persona communication format |
| Persona Definitions | 1.2.0 | Persona workflows and responsibilities |
| Task Management | 1.2.0 | Task queue and coordination system |
| Directory Structure | 1.2.2 | Framework file organization |

## [Unreleased]

### To Add
- Automated contract validation
- Persona performance metrics
- Enhanced merge conflict resolution
- Advanced task dependency visualization
- Cross-persona workload balancing

## [1.2.2] - 2024-06-23

### Component Versions
- Framework: 1.2.1 → 1.2.2
- CLAUDE.md: 1.2.1 → 1.2.2
- Directory Structure: 1.2.1 → 1.2.2

### Fixed
- **Dependabot Configuration**: Updated configuration for template repository to prevent monitoring errors
  - Removed monitoring for ecosystems without dependencies (npm, pip, docker)
  - Added clear template documentation and examples
  - Updated reviewer configuration

### Enhanced
- **Git Repository Documentation**: Comprehensive improvements to git setup instructions
  - Added explicit git initialization step in "First Steps with Claude"
  - Enhanced all Usage Examples with git workflow references
  - Updated project/README.md with clear git setup instructions
  - Emphasized git isolation between framework and project repositories
  - Updated terminology consistency (roles → personas)

## [1.2.1] - 2024-06-23

### Component Versions
- Framework: 1.2.0 → 1.2.1
- CLAUDE.md: 1.2.0 → 1.2.1
- Directory Structure: 1.0.0 → 1.2.1

### Changed
- **Git Repository Structure**: Clarified that git repositories should be initialized only within project/ directory
  - Updated documentation to specify version control isolation between framework and project
  - Framework files remain outside of project's git history for clean project repositories
  - Updated setup instructions in README.md for proper git initialization

### Enhanced
- **Project Integration Documentation**: Improved clarity on directory structure and version control separation
- **Setup Guide**: Enhanced initial setup instructions with proper git repository structure

## [1.2.0] - 2024-01-24

### Component Versions
- Framework: 1.1.0 → 1.2.0
- CLAUDE.md: 1.1.0 → 1.2.0
- Session State Schema: 1.1.0 → 1.2.0
- Persona Definitions: 1.1.0 → 1.2.0
- Task Management: NEW → 1.2.0

### Changed
- **Terminology Transformation**: Complete migration from "subagents" to "personas"
  - Updated all documentation and code references
  - Aligned terminology with Claude Code operational vocabulary
  - Maintained all existing functionality while improving clarity

### Added
- **Enhanced Task Management System**: Comprehensive task queue management within personas
  - Task lifecycle: Created → Queued → Active → Blocked/Completed → Archived
  - Priority framework: High/Medium/Low with dependency tracking
  - Cross-persona task coordination protocols
- **Task Templates**: Structured templates for task creation and coordination
  - `task-template.md`: Comprehensive task definition template
  - `persona-coordination-template.md`: Cross-persona collaboration framework
- **Advanced Coordination Features**:
  - Task dependency tracking between personas
  - Formal task handoff protocols
  - Shared artifact management
  - Coordination point scheduling

### Enhanced
- **Session State Management**: Extended schema for persona-based task tracking
  - Task queue states per persona (active, queued, completed, blocked)
  - Cross-persona coordination tracking
  - Task dependency and conflict detection
- **Documentation**: Updated all framework documentation for persona terminology
  - Enhanced workflows with task-based operations
  - Improved coordination protocols
  - Better session continuity with task-aware state management

## [1.1.0] - 2024-01-23

### Component Versions
- CLAUDE.md: 1.0.0 → 1.1.0
- Session State Schema: 1.0.0 → 1.1.0
- Command Set: 1.0.0 → 1.1.0
- Persona Definitions: 1.0.0 → 1.1.0

### Added
- **Autonomous Architecture**: True autonomous parallel execution capability
  - Each persona operates independently with specialized workflows
  - Parallel execution using Task tool
  - Asynchronous coordination through message queues
- **Multi-Branch Development**: Personas can work on different git branches simultaneously
  - Per-persona git context tracking
  - Branch-aware session recovery
  - Isolated development environments
- **Intelligent Context Management**: Strategies for long sessions
  - Efficient mode for token optimization
  - Context pruning guidelines
  - Git-aware context preservation
- **New Commands**:
  - `/think`: Structured reasoning mode for complex decisions
  - `/efficient`: Token-optimized responses for long sessions
- **Enhanced Role Workflows**: All roles now include detailed exploration phases
  - Mandatory codebase analysis
  - Pattern identification
  - Assumption documentation

### Changed
- Session state structure now includes:
  - `context_management` section for optimization tracking
  - `subagent_coordination` with message queue and handoff points
  - `git_context` for minimal branch tracking
- Renamed "Workflow Orchestration" to "Parallel Subagent Orchestration"
- All role definitions enhanced with exploration phase details

### Security
- Added framework-level SECURITY.md policy
- Integrated security considerations into role workflows

## [1.0.0] - 2024-01-15

### Component Versions
- CLAUDE.md: 1.0.0
- Session State Schema: 1.0.0
- Command Set: 1.0.0
- Contract Protocol: 1.0.0
- Role Definitions: 1.0.0
- Directory Structure: 1.0.0

### Added
- **Eight Specialized Roles**:
  - Project Manager: Coordinate → Plan → Track → Communicate
  - Architect: Explore → Design → Validate → Document
  - Frontend Developer: Explore → Plan → Code → Commit
  - Backend Developer: Explore → Plan → Code → Commit
  - QA Engineer: Write Tests → Validate → Iterate → Commit
  - DevOps Engineer: Assess → Configure → Deploy → Monitor
  - Security Engineer: Audit → Identify → Mitigate → Validate
  - Cloud Engineer: Analyze → Architect → Provision → Optimize
- **Contract-Based Communication**: Formal interfaces between roles
- **Session State Management**: Persistent context across interactions
- **Natural Parallelization**: Concurrent work identification
- **Quality Assurance Integration**: Built-in quality checkpoints
- **Project Structure**:
  - `artifacts/`: Generated artifacts and contracts
  - `logs/`: Session management and logging
  - `project/`: Actual project code
  - `specs/`: Project specifications
  - `templates/`: Reusable document templates
- **Command Templates**: Help, status, session management commands
- **Framework Documentation**: Comprehensive CLAUDE.md and README.md

### Security
- Basic .gitignore configuration
- Sensitive file exclusions

## Version Compatibility

| Framework Version | Required Component Versions |
|------------------|----------------------------|
| 1.1.0 | CLAUDE.md ≥ 1.1.0<br>Session State ≥ 1.1.0<br>Commands ≥ 1.0.0<br>Contracts = 1.0.0 |
| 1.0.0 | All components = 1.0.0 |

## Migration Guide

### From 1.0.0 to 1.1.0

1. **Update session-state.json**:
   - Add `context_management` section
   - Add `subagent_coordination` section
   - Add `git_context` section

2. **Update CLAUDE.md**:
   - Review new Subagent Architecture section
   - Update role workflows with enhanced exploration phases

3. **New Commands**:
   - Review `/think` command for complex decisions
   - Use `/efficient` for long sessions

4. **Multi-Branch Development**:
   - Each subagent can now work on separate branches
   - Update your workflow to leverage parallel development

---

For detailed version history of individual components, see their respective files.