---
allowed-tools: Read(project/*), Write(project/*), Edit(project/*), MultiEdit(project/*), Bash(*), Grep(project/*), Glob(project/*)
description: Core development workflow - implement features, fix bugs, enhance code in @project/
---

# Development Command

## Context

- Project requirements: @specs/ directory
- Project architecture: @specs/ directory  
- Project source code: @project/src/ directory
- Project tests: @project/tests/ directory
- Project documentation: @project/docs/ directory
- Project configuration: @project/config/ directory
- Current git status: !`cd project && git status --porcelain`

## Your Task

Handle all core development tasks within the project directory:

**IMPORTANT**: Before implementing any feature or making changes:

1. **Validate Against Requirements**: Check @specs/ directory for project specifications
2. **Architecture Compliance**: Ensure alignment with architecture docs in @specs/
3. **Requirement Changes**: If current requirements don't support the requested task, ask user: 
   "This task requires changes to project requirements in @specs/. Should I proceed with updating the specifications to include [specific change needed]?"

### Core Development Tasks:

1. **Feature Implementation**: Build new functionality in @project/src/
2. **Bug Fixes**: Identify and resolve issues in @project/
3. **Code Enhancement**: Refactor and optimize existing @project/ code
4. **Integration**: Connect components within @project/
5. **Task Assignment**: Direct specific work to appropriate development roles
6. **Parallel Development**: Use worktrees for isolated parallel work
7. **Sub-Agent Delegation**: Spawn sub-agents for complex task subdivision

## Usage Patterns

### Implement Feature

`/dev implement user-authentication`
`/dev add dashboard-component`
`/dev create api/users endpoint`

### Fix Issues  

`/dev fix login-bug`
`/dev resolve performance-issue`
`/dev debug failing-tests`

### Enhance Code

`/dev refactor auth-module`
`/dev optimize database-queries`
`/dev improve error-handling`

### Role-Specific Assignment

`/dev frontend create-login-form`
`/dev backend implement-jwt-auth`
`/dev fullstack user-registration-flow`

### Parallel Development

`/dev parallel implement-user-dashboard` (spawns worktrees for parallel work)
`/dev worktree create-feature-branch feature/api-v2`
`/dev sub-agents delegate-task "Implement authentication system"`

## Response Format

```text
💻 Development: [Task Description]
Target: project/[specific-directory]/
Role: [Frontend/Backend/Fullstack/Architecture]
Priority: [High/Medium/Low]

## Requirements Validation
✅ Aligns with specifications in @specs/
⚠️ Requires specification update: [details]
❌ Conflicts with current requirements: [explanation]

## Implementation Plan
1. [Step 1 with specific @project/ directory paths]
2. [Step 2 with specific @project/ directory paths]
3. [Step 3 with specific @project/ directory paths]

## Files to Modify/Create
- @project/src/[component-directory]/
- @project/tests/[test-directory]/
- @project/docs/[documentation-directory]/

## Dependencies
- [Internal project dependencies]
- [External packages needed in @project/]

[Actual implementation with code examples]

## Next Steps
- [Follow-up tasks within @project/ directories]
- [Testing requirements in @project/tests/]
- [Documentation updates in @project/docs/]
```

## Parallel Development Integration

### Worktree-Based Development
When implementing complex features, automatically consider worktree isolation:

**Triggers for Worktree Creation:**
- Tasks involving multiple developers/roles simultaneously
- Large features that can be subdivided
- Bug fixes that might conflict with ongoing development
- Experimental implementations that need isolation

**Implementation:**
```bash
# For complex tasks, first assess if parallel development would help
if [[ "$ARGUMENTS" =~ (parallel|worktree|complex|large) ]]; then
    /project:worktree action=create persona=[detected-persona] branch=[feature-branch]
fi

# For sub-agent delegation
if [[ "$ARGUMENTS" =~ (sub-agents|delegate|subdivide) ]]; then
    /project:worktree action=spawn-sub-agent task="$TASK_DESCRIPTION" delegation-pattern=feature_subdivision
fi
```

### Sub-Agent Task Delegation
For tasks that benefit from parallel execution:

1. **Task Analysis**: Analyze if task can be subdivided
2. **Persona Detection**: Determine primary persona (frontend, backend, fullstack)
3. **Worktree Creation**: Create isolated development environment
4. **Sub-Agent Spawning**: Delegate subtasks to specialized sub-agents
5. **Coordination Setup**: Establish integration points and communication

### Integration with Existing Workflow
- Worktree operations integrate seamlessly with current dev workflow
- Sub-agents maintain same requirement validation and architecture compliance
- All parallel work still focuses on @project/ directory structure
- Session state tracks cross-worktree dependencies and coordination

Focus all development work within the @project/ directory structure, ensuring alignment with specifications in @specs/ directory. Leverage worktrees and sub-agents for complex tasks requiring parallel development.