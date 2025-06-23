---
allowed-tools: Read(*), Write(*), Bash(cd project && *)
description: Create a progress checkpoint snapshot with rollback capability for @project/
---

# Progress Checkpoint

## Context

- Project specifications: @specs/ directory
- Project source code: @project/src/ directory
- Project tests: @project/tests/ directory
- Project documentation: @project/docs/ directory
- Project configuration: @project/config/ directory
- Code state: !`cd project && git rev-parse --short HEAD 2>/dev/null || echo "No git repository"`
- Working directory: !`cd project && git status --porcelain 2>/dev/null || echo "No git repository"`

## Your Task

Create a comprehensive checkpoint snapshot that captures:

**IMPORTANT**: Checkpoint must validate against project requirements:

1. **Project State**: Current @project/ implementation status vs @specs/ requirements
2. **Code Snapshot**: Current @project/ code state and recent changes
3. **Requirements Compliance**: How well @project/ aligns with @specs/ directory
4. **Implementation Progress**: Feature completion status in @project/
5. **Rollback Information**: Data needed to revert @project/ to this checkpoint

## Checkpoint Creation Process

### State Capture
- Document current progress across all roles
- Capture active tasks and their completion status
- Record cross-role dependencies and assumptions
- Save contract consumption and publication state

### Code Integration
- Record current git commit hash (if project uses git)
- Capture recent code changes and their impact
- Document any pending code changes or work-in-progress
- Note integration points and testing status

### Rollback Preparation
- Identify reversible vs. irreversible changes
- Document rollback procedures and dependencies
- Capture external system state if relevant
- Note potential rollback risks and mitigations

## Response Format

```text
📅 Checkpoint Created
Checkpoint ID: checkpoint-[timestamp]
Created: [full timestamp]
Project Location: @project/
Code State: [git hash or code snapshot reference]

## Requirements Compliance Snapshot
✅ [X]% of @specs/ requirements implemented in @project/
⚠️ [X] requirements partially implemented  
❌ [X] requirements not started
📋 [X] implemented features not documented in @specs/

## Project Progress Snapshot
🏆 **Overall Progress**: [X]% complete against @specs/
🏁 **Current Milestone**: [milestone name and status]
📈 **Implementation Velocity**: [recent progress rate in @project/]

### Role Progress
| Role | Workflow Stage | Completed Tasks | Active Tasks | Blockers |
|------|----------------|-----------------|--------------|----------|
| PM | [stage] | [count] | [count] | [count] |
| Architect | [stage] | [count] | [count] | [count] |
| Frontend | [stage] | [count] | [count] | [count] |
| Backend | [stage] | [count] | [count] | [count] |
| QA | [stage] | [count] | [count] | [count] |
| DevOps | [stage] | [count] | [count] | [count] |
| Security | [stage] | [count] | [count] | [count] |
| Cloud | [stage] | [count] | [count] | [count] |

## Contract Status
🔗 **Active Contracts**: [count]
- API Contracts: [count active, versions]
- Data Contracts: [count active, versions]
- Testing Contracts: [count active, versions]
- Security Contracts: [count active, versions]
- Infrastructure Contracts: [count active, versions]

🔄 **Recent Contract Changes**:
- Updated: [list of recently updated contracts]
- Deprecated: [list of contracts marked for deprecation]
- New: [list of newly created contracts]

## Project Code State (@project/)
💻 **Current Code Status**:
- Last Commit: [hash and message if available]
- Working Directory: [clean/modified files in @project/]
- Staged Changes: [count if any in @project/]
- Recent Changes: [summary of last few commits in @project/]

🧪 **Quality Status**:
- Tests Passing: [status from @project/tests/]
- Code Quality: [assessment of @project/src/]
- Security Review: [security status of @project/]
- Performance: [performance metrics from @project/]

📁 **Directory Status**:
- @project/src/: [file count and structure assessment]
- @project/tests/: [test coverage and quality]
- @project/docs/: [documentation completeness]
- @project/config/: [configuration status]

## Dependencies & Assumptions
🔗 **Cross-Role Dependencies**:
- Blocking: [count] dependencies waiting on other roles
- Non-blocking: [count] assumptions made to proceed
- Critical Path: [current critical path items]

📄 **Documented Assumptions**:
- [List of key assumptions made by roles]
- [Items proceeding with incomplete information]

## Rollback Information

🔙 **Rollback Capability**:
- **Full Rollback**: [Possible/Limited/Not Recommended]
- **Partial Rollback**: [Available options]
- **Risk Level**: [Low/Medium/High]

🚨 **Rollback Considerations**:
- **Irreversible Changes**: [External integrations, deployed features]
- **Data Impact**: [Database changes, user data]
- **Contract Impact**: [Published contracts, external dependencies]
- **Timeline Impact**: [Estimated time to rollback and resume]

🔧 **Rollback Procedure**:
1. [Step 1 of rollback process]
2. [Step 2 of rollback process]
3. [Step 3 of rollback process]

## Checkpoint Files
📁 **Saved Artifacts**:
- Session State: logs/checkpoints/checkpoint-[timestamp]-session.json
- Contract Snapshot: logs/checkpoints/checkpoint-[timestamp]-contracts.json
- Progress Report: logs/checkpoints/checkpoint-[timestamp]-progress.md
- Code Reference: logs/checkpoints/checkpoint-[timestamp]-code.txt

## Next Steps Recommendation
🏁 **Continue Path**: [Recommended next actions to maintain progress]
🔀 **Alternative Path**: [Alternative approaches if current path encounters issues]
📅 **Next Checkpoint**: Recommended in [timeframe] or after [milestone]

---

✅ **Checkpoint Complete**
Checkpoint successfully created and stored
Restore command: Use /project:session load checkpoint-[timestamp] to restore
```

Create actual checkpoint files in logs/checkpoints/ directory with detailed state information for potential rollback.