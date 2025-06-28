# Worktree Management Command

Unified command for managing git worktrees with persona isolation and sub-agent delegation.

## Command Usage
`/project:worktree action=<action> [parameters...]`

## Available Actions

### create
Create new worktree for persona-based development
```
/project:worktree action=create persona=<persona> branch=<branch> [base=<base-branch>] [sub-agent=true]
```

### switch  
Switch to existing worktree and activate persona context
```
/project:worktree action=switch name=<worktree-name> [activate-persona=true]
```

### cleanup
Clean up completed or stale worktrees
```
/project:worktree action=cleanup [name=<worktree-name>] [force=true] [auto=true] [sub-agents-only=true]
```

### spawn-sub-agent
Create sub-agents for parallel task execution
```
/project:worktree action=spawn-sub-agent task=<task-description> [count=<number>] [delegation-pattern=<pattern>]
```

### list
Display all active worktrees and their status
```
/project:worktree action=list [persona=<persona>] [status=active|completed|stale]
```

### status
Show detailed status of current or specified worktree
```
/project:worktree action=status [name=<worktree-name>]
```

## Implementation Workflow

### 1. Parse Action and Arguments
```bash
# Extract action from arguments
ACTION=$(echo "$ARGUMENTS" | grep -o 'action=[^[:space:]]*' | cut -d'=' -f2)

# Route to appropriate sub-workflow based on action
case "$ACTION" in
    create) execute_create_workflow ;;
    switch) execute_switch_workflow ;;
    cleanup) execute_cleanup_workflow ;;
    spawn-sub-agent) execute_spawn_sub_agent_workflow ;;
    list) execute_list_workflow ;;
    status) execute_status_workflow ;;
    *) echo "Unknown action: $ACTION" && show_usage ;;
esac
```

### 2. Create Workflow
Execute worktree creation with validation and setup:
- Parse persona, branch, and optional parameters
- Validate against configuration limits
- Create git worktree with proper branch setup
- Initialize worktree metadata and task management
- Register in shared coordination system
- Enable sub-agent spawning capabilities

### 3. Switch Workflow  
Switch context to existing worktree:
- Find worktree by name or partial match
- Change working directory to worktree
- Load persona context and task queue state
- Activate persona if requested
- Display current status and available actions

### 4. Cleanup Workflow
Clean up worktrees with coordination:
- Identify cleanup targets based on criteria
- Handle sub-agent relationship cleanup
- Coordinate parent-child worktree dependencies
- Remove git worktrees and update shared state
- Archive important task and coordination data

### 5. Spawn Sub-Agent Workflow
Delegate tasks to sub-agents:
- Analyze task for subdivision opportunities
- Create sub-agent worktrees with proper isolation
- Use Task tool to spawn sub-agents with specific instructions
- Set up coordination protocols and message queues
- Monitor sub-agent progress and integration points

### 6. List Workflow
Display worktree information:
```bash
echo "Active Worktrees:"
find worktrees/ -maxdepth 1 -type d ! -name "shared-state" | while read -r worktree; do
    if [[ -f "$worktree/.worktree-meta.json" ]]; then
        PERSONA=$(jq -r '.persona' "$worktree/.worktree-meta.json")
        BRANCH=$(jq -r '.branch' "$worktree/.worktree-meta.json") 
        IS_SUB_AGENT=$(jq -r '.is_sub_agent' "$worktree/.worktree-meta.json")
        echo "  $(basename "$worktree") - $PERSONA on $BRANCH $([ "$IS_SUB_AGENT" = "true" ] && echo "[sub-agent]")"
    fi
done
```

### 7. Status Workflow
Show detailed worktree status:
- Display worktree metadata and configuration
- Show git status and branch information
- List active tasks and sub-agents
- Display coordination status and dependencies
- Show recent activity and progress metrics

## Sub-Agent Integration Features

### Automatic Sub-Agent Management
- **Delegation Patterns**: feature_subdivision, parallel_implementation, testing_isolation, documentation_generation
- **Task Coordination**: Message queue-based coordination between parent and sub-agents
- **Resource Management**: Automatic cleanup of completed sub-agents
- **Integration Points**: Defined synchronization moments for combining work

### Cross-Worktree Coordination
```json
{
  "shared_coordination": {
    "active_worktrees": {
      "frontend-auth-ui": {
        "persona": "frontend_developer",
        "sub_agents": ["frontend-auth-ui-login", "frontend-auth-ui-signup"],
        "coordination_status": "active"
      }
    },
    "sub_agent_relationships": {
      "frontend-auth-ui-login": {
        "parent": "frontend-auth-ui",
        "siblings": ["frontend-auth-ui-signup"],
        "task_assignment": "Login component implementation"
      }
    }
  }
}
```

### Task Delegation Automation
When spawning sub-agents:
1. **Task Analysis**: Use Task tool to analyze and subdivide work
2. **Worktree Creation**: Create isolated worktrees for each sub-task
3. **Agent Spawning**: Use Task tool to create sub-agents with specific contexts
4. **Coordination Setup**: Establish message queues and integration points
5. **Progress Monitoring**: Track sub-agent progress and coordinate integration

## Configuration Integration

### Worktree Limits and Settings
Read from `.claude/worktree-config.json`:
- Maximum active worktrees per persona
- Sub-agent limits and delegation patterns
- Auto-cleanup thresholds and policies
- Coordination protocols and message queue settings

### Session State Integration
Update session state with worktree awareness:
- Track active worktrees and persona assignments
- Maintain cross-worktree task dependencies
- Preserve sub-agent relationships and coordination state
- Enable session recovery across multiple worktrees

## Examples

### Complete Development Workflow
```bash
# Create main feature worktree
/project:worktree action=create persona=frontend_developer branch=feature/user-dashboard

# Switch to worktree and spawn sub-agents for parallel work
/project:worktree action=switch name=frontend-user-dashboard
/project:worktree action=spawn-sub-agent task="Implement dashboard components" count=3 delegation-pattern=feature_subdivision

# Monitor progress and cleanup when complete
/project:worktree action=list persona=frontend_developer
/project:worktree action=cleanup auto=true
```

### Sub-Agent Coordination Example
```bash
# Parent persona creates complex feature
/project:worktree action=create persona=backend_developer branch=feature/api-v2

# Spawn sub-agents for different API modules
/project:worktree action=spawn-sub-agent task="Implement user management API endpoints" 
/project:worktree action=spawn-sub-agent task="Implement payment processing API"
/project:worktree action=spawn-sub-agent task="Create comprehensive API test suite" delegation-pattern=testing_isolation

# Sub-agents work in parallel, coordinate through message queue
# Parent persona monitors and integrates completed work
```

## Success Criteria
- ✅ All worktree operations accessible through single command interface
- ✅ Sub-agent spawning and coordination fully automated
- ✅ Cross-worktree dependency management working
- ✅ Session state properly updated with worktree context
- ✅ Integration with existing persona workflows seamless
- ✅ Task delegation and parallel execution functional

## Error Handling
- Invalid action: Display usage and available actions
- Resource limits: Show current usage and suggest cleanup
- Git errors: Display git output with troubleshooting guidance
- Coordination conflicts: Identify issues and suggest resolution
- Sub-agent failures: Provide recovery and task reassignment options