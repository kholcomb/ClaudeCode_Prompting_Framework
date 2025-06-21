---
allowed-tools: Read(*), Write(*), Bash(*)
description: Create a progress checkpoint snapshot with rollback capability
---

# Progress Checkpoint

## Context
- Current session state: @logs/session-state.json
- Project progress: @specs/project-plan.md
- Code state: !`cd project && git rev-parse --short HEAD`
- Active contracts: @artifacts/contracts/
- Recent activity: !`find logs -name "*.log" -mtime -1 | wc -l` log entries

## Your Task
Create a comprehensive checkpoint snapshot that captures:

1. **Progress State**: All completed work and current status
2. **Code Snapshot**: Current code state and recent changes
3. **Contract Status**: All active contracts and their versions
4. **Role Context**: Each role's current workflow stage and assignments
5. **Rollback Information**: Data needed to revert to this checkpoint

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
```
📅 Checkpoint Created
Checkpoint ID: checkpoint-[timestamp]
Created: [full timestamp]
Code State: [git hash or code snapshot reference]

## Progress Snapshot
🏆 **Overall Progress**: [X]% complete
🏁 **Current Milestone**: [milestone name and status]
📈 **Velocity**: [recent progress rate]

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

## Code State
💻 **Current Code Status**:
- Last Commit: [hash and message if available]
- Working Directory: [clean/modified]
- Staged Changes: [count if any]
- Recent Changes: [summary of last few commits]

🧪 **Quality Status**:
- Tests Passing: [status]
- Code Quality: [lint/quality check status]
- Security Scans: [status]
- Performance: [any performance metrics]

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