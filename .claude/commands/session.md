---
allowed-tools: Read(*), Write(*), Edit(*), Bash(*)
description: Manage session state - save, load, or clear current work context
---

# Session State Management

## Context
- Current session state: @logs/session-state.json
- Command parameter: [save|load|clear]
- Project artifacts: @artifacts/
- Active contracts: @artifacts/contracts/

## Your Task
Manage session state based on the specified operation:

### Save Operation
1. **Capture Current State**: Document all active work, role assignments, progress
2. **Contract Status**: Record active, deprecated, and pending contracts
3. **Dependencies**: Map current cross-role dependencies and blockers
4. **Assumptions**: Document assumptions made by each role
5. **Continuation Context**: Provide detailed context for session resumption

### Load Operation
1. **Restore Context**: Load previous session state and role assignments
2. **Validate Contracts**: Check if contracts have changed since last save
3. **Update Dependencies**: Refresh dependency status and resolve any conflicts
4. **Resume Planning**: Provide continuation recommendations for each role

### Clear Operation
1. **Archive Current Work**: Move current state to archived logs
2. **Reset Context**: Clear all role assignments and active tasks
3. **Preserve Contracts**: Keep active contracts but reset consumption tracking
4. **Clean Slate**: Prepare for new project phase or initiative

## Response Format

### Save Operation
```
💾 Session Saved
Timestamp: [current timestamp]
Session ID: [unique identifier]

## Captured State
📋 **Active Roles**: [count] roles with assigned work
📄 **Task Progress**: [completed]/[total] tasks
🔗 **Contract Status**: [active]/[deprecated]/[pending] contracts
🔄 **Dependencies**: [count] cross-role dependencies

## Role Status Summary
| Role | Current Stage | Active Tasks | Blockers |
|------|---------------|--------------|----------|
| PM | [stage] | [count] | [count] |
| Architect | [stage] | [count] | [count] |
| Frontend | [stage] | [count] | [count] |
| Backend | [stage] | [count] | [count] |
| QA | [stage] | [count] | [count] |
| DevOps | [stage] | [count] | [count] |
| Security | [stage] | [count] | [count] |
| Cloud | [stage] | [count] | [count] |

## Continuation Instructions
**Next Session Start**: [Recommended first action]
**Priority Tasks**: [Top 3 tasks to resume]
**Pending Decisions**: [Items needing prompter input]

✅ Session state successfully saved to logs/session-state.json
```

### Load Operation  
```
💼 Session Loaded
Restored From: [timestamp of saved session]
Session ID: [identifier]

## Restored Context
🔄 **State Recovery**: Successfully restored [count] role assignments
📄 **Task Continuity**: [completed]/[total] tasks from previous session
🔗 **Contract Sync**: [count] contracts validated, [count] updated since save
⚠️ **Changes Detected**: [any significant changes since last save]

## Resume Recommendations
🏁 **Immediate Actions**:
1. [First recommended action]
2. [Second recommended action]
3. [Third recommended action]

🔍 **Status Check Needed**:
- [Items requiring validation]
- [Contracts needing review]
- [Dependencies to verify]

## Updated Priorities
[Refreshed priority list based on current state]

✅ Session successfully restored - ready to continue work
```

### Clear Operation
```
🧽 Session Cleared
Previous State Archived: [archive location]
Timestamp: [current timestamp]

## Cleanup Summary
📺 **Archived**: Previous session moved to logs/archive/
🔄 **Reset**: All role assignments and active tasks cleared
📄 **Preserved**: Active contracts maintained for reference
🆕 **Fresh Start**: Ready for new project phase

## Preserved Elements
- Interface contracts in artifacts/contracts/
- Project specifications in specs/
- Historical logs in logs/archive/
- Templates and reusable patterns

## Next Steps
1. Review project specifications to understand current requirements
2. Use /project:assign to delegate new tasks
3. Consider /project:meeting to align team on new objectives

✅ Session cleared - clean slate ready for new work
```

Always update the actual session-state.json file with the operation results.