# Session Logs and State Management

This directory contains session state, activity logs, and checkpoint data for the multi-agent framework.

## Directory Structure

```
logs/
├── session-state.json      # Current session state and role context
├── activity.log           # Detailed activity log
├── checkpoints/           # Progress snapshots for rollback
│   ├── checkpoint-[timestamp]-session.json
│   ├── checkpoint-[timestamp]-contracts.json
│   └── checkpoint-[timestamp]-progress.md
└── archive/               # Historical session data
    ├── session-[date]/
    └── archived-states/
```

## Session State Structure

The `session-state.json` file tracks:

### Session Information
- Session ID and timestamps
- Project name and current phase
- Overall status and progress

### Role Status
For each team role:
- Current workflow stage
- Active, completed, and blocked tasks
- Assumptions and dependencies
- Role-specific context and state

### Contract Management
- Active contracts and their status
- Deprecated contracts with migration info
- Contract consumption tracking

### Dependencies
- Blocking dependencies requiring immediate attention
- Non-blocking dependencies with assumptions
- Soft dependencies for coordination

### Progress Tracking
- Overall completion percentage
- Milestone status and targets
- Critical path analysis
- Team velocity metrics

### Decision Tracking
- Architectural decisions and rationale
- Technical choices and trade-offs
- Process decisions and improvements

### Risk Management
- High, medium, and low risk items
- Risk mitigation strategies
- Risk monitoring status

## Activity Logging

The `activity.log` file captures:
- Command executions and results
- Role assignments and completions
- Contract publications and updates
- Decision points and rationale
- Error conditions and resolutions

## Checkpoint Management

Checkpoints provide rollback capability:

### Checkpoint Files
- **session.json**: Complete session state snapshot
- **contracts.json**: All contract states and versions
- **progress.md**: Human-readable progress summary
- **code.txt**: Code state reference (git hash, etc.)

### Checkpoint Strategy
- Automatic checkpoints at major milestones
- Manual checkpoints via `/project:checkpoint` command
- Retention policy: Keep last 10 checkpoints
- Rollback capability via session load commands

## Archive Management

### Archival Process
- Sessions archived when cleared or completed
- Complete history preserved for analysis
- Compressed storage for older sessions
- Searchable metadata for historical lookup

### Retention Policy
- Active session: Indefinite retention
- Completed sessions: 1 year retention
- Archived sessions: Compressed after 6 months
- Cleanup: Automated monthly cleanup of old data

## Session Operations

### Save Session
Captures current state including:
- All role contexts and assignments
- Contract status and consumption
- Progress and milestone status
- Dependencies and assumptions
- Recent decisions and risks

### Load Session
Restores previous state including:
- Role context and workflow stages
- Active tasks and assignments
- Contract consumption state
- Dependency relationships
- Decision history

### Clear Session
Resets session while preserving:
- Active contracts (marked as available)
- Project specifications
- Historical logs (moved to archive)
- Checkpoint history

## Monitoring and Analytics

### Session Health
- Active role count and utilization
- Dependency resolution rates
- Contract publication and consumption
- Progress velocity and trends

### Performance Metrics
- Task completion rates by role
- Average time to resolve dependencies
- Contract accuracy and stability
- Session continuity success rates

### Quality Indicators
- Decision reversal rates
- Assumption validation success
- Risk mitigation effectiveness
- Team coordination efficiency

## Best Practices

### Regular Saves
- Save session state after major work
- Checkpoint before risky operations
- Backup before major changes

### State Hygiene
- Regular cleanup of completed tasks
- Archive old sessions periodically
- Validate state consistency

### Documentation
- Document major decisions in session state
- Capture assumptions for future validation
- Record rationale for architectural choices

---

*Session state management enables seamless work continuity and provides comprehensive project context for all team roles.*