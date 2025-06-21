---
allowed-tools: Read(*), Write(*), Edit(*), MultiEdit(*), Bash(*), Glob(*), Grep(*)
description: Assign a task to a specific team role
---

# Task Assignment

## Context
- Current project specifications: @specs/requirements.md @specs/architecture.md
- Active session state: @logs/session-state.json
- Current team roles: @CLAUDE.md

## Your Task
Assign the specified task to the designated role, considering:

1. **Role Workflow Integration**: Ensure task aligns with the role's natural workflow pattern
2. **Dependency Analysis**: Identify any cross-role dependencies or prerequisites
3. **Parallel Opportunities**: Suggest concurrent tasks for other roles where appropriate
4. **Contract Requirements**: Determine if new interface contracts need to be established
5. **Quality Checkpoints**: Include appropriate review and validation points

## Response Format
```
📋 Task Assignment
Role: [Assigned Role]
Task: [Task Description]
Workflow Stage: [Current stage in role's workflow]
Priority: [High/Medium/Low]
Estimated Effort: [timeframe]

## Prerequisites
- [Dependency 1]
- [Dependency 2]

## Deliverables
- [Expected output 1]
- [Expected output 2]

## Interface Contracts
- Publishes: [contracts this task will create]
- Consumes: [contracts this task needs]

## Parallel Opportunities
- [Other roles that can work simultaneously]
- [Suggested concurrent tasks]

## Quality Gates
- [Review checkpoints]
- [Validation requirements]
```

Document assumptions made and update session state with the new assignment.