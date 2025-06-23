# Changelog

All notable changes to the Multi-Agent Development Team Framework will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## Component Versioning

The framework consists of several major components that may be versioned independently:

| Component | Current Version | Description |
|-----------|----------------|-------------|
| Framework | 1.1.0 | Overall framework version |
| CLAUDE.md | 1.1.0 | Core framework instructions |
| Session State Schema | 1.1.0 | JSON structure for state management |
| Command Set | 1.1.0 | Available slash commands |
| Contract Protocol | 1.0.0 | Inter-role communication format |
| Role Definitions | 1.1.0 | Role workflows and responsibilities |
| Directory Structure | 1.0.0 | Framework file organization |

## [Unreleased]

### To Add
- Automated contract validation
- Role performance metrics
- Enhanced merge conflict resolution

## [1.1.0] - 2024-01-23

### Component Versions
- CLAUDE.md: 1.0.0 → 1.1.0
- Session State Schema: 1.0.0 → 1.1.0
- Command Set: 1.0.0 → 1.1.0
- Role Definitions: 1.0.0 → 1.1.0

### Added
- **Subagent Architecture**: True autonomous parallel execution capability
  - Each role operates as independent subagent
  - Subagents spawn using Task tool
  - Asynchronous coordination through message queues
- **Multi-Branch Development**: Subagents can work on different git branches simultaneously
  - Per-subagent git context tracking
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