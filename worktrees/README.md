# Worktrees Directory

This directory contains isolated git worktrees for persona-based parallel development.

## Structure

```
worktrees/
├── shared-state/                    # Cross-worktree coordination
│   ├── coordination.json           # Message queue and sync state
│   └── contracts/                  # Shared contracts and interfaces
├── {persona}-{feature}/            # Main persona worktrees
│   ├── .worktree-meta.json        # Worktree metadata and configuration
│   ├── .task-management.json      # Task delegation and sub-agent management
│   └── [project files]            # Isolated project code
└── {persona}-{feature}-sub-{id}/   # Sub-agent worktrees
    ├── .worktree-meta.json        # Sub-agent metadata
    └── [project files]            # Sub-agent specific work
```

## Worktree Management

### Creating Worktrees
Use the unified worktree command:
```bash
/project:worktree action=create persona=frontend_developer branch=feature/auth-ui
/project:worktree action=create persona=backend_developer branch=feature/api-v2 base=development
```

### Sub-Agent Delegation
Spawn sub-agents for parallel task execution:
```bash
/project:worktree action=spawn-sub-agent task="Implement user authentication components" count=3
```

### Switching Between Worktrees
```bash
/project:worktree action=switch name=frontend-auth-ui
/project:worktree action=list
```

### Cleanup
```bash
/project:worktree action=cleanup auto=true
/project:worktree action=cleanup name=specific-worktree force=true
```

## Coordination Protocol

### Message Queue
Sub-agents and personas coordinate through `shared-state/coordination.json`:
- Progress updates
- Dependency notifications
- Integration point coordination
- Task delegation requests

### Contract Synchronization
Shared contracts and interfaces are synchronized across all worktrees to maintain consistency.

### Sub-Agent Management
Parent personas can spawn multiple sub-agents for:
- Feature subdivision (breaking large features into components)
- Parallel implementation (simultaneous work on non-conflicting parts)
- Testing isolation (separate test development)
- Documentation generation (parallel docs with code development)

## Best Practices

1. **Isolation**: Each worktree works on isolated branches and files
2. **Coordination**: Use message queue for cross-worktree communication
3. **Integration**: Define clear integration points and synchronization moments
4. **Cleanup**: Regular cleanup of completed worktrees to manage resources
5. **Documentation**: Maintain clear task assignments and progress tracking

## Session Recovery

Worktree state is preserved in session state for recovery:
- Active worktrees and their assignments
- Sub-agent relationships and task delegations
- Cross-worktree dependencies and coordination status
- Integration points and synchronization state