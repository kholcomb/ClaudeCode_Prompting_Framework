---
allowed-tools: Read(*), Write(*), Edit(*)
description: Planning, coordination, and team meetings for @project/ development
---

# Planning Command

## Context

- Project specifications: @specs/ directory
- Project source code: @project/src/ directory
- Project tests: @project/tests/ directory
- Project documentation: @project/docs/ directory
- Project configuration: @project/config/ directory

## Your Task

Handle all planning and coordination for @project/ development:

**IMPORTANT**: All planning must align with project requirements:

1. **Requirements Validation**: Ensure plans align with @specs/ directory
2. **Architecture Alignment**: Plans must follow guidelines in @specs/
3. **Specification Updates**: If planning requires @specs/ changes, ask user:
   "This plan requires updates to project specifications in @specs/. Should I proceed with updating [specific files] to include [specific changes]?"

### Planning Types:

1. **Feature Planning**: Plan implementation of features in @project/
2. **Team Coordination**: Coordinate work across roles for @project/
3. **Meeting Facilitation**: Cross-role meetings about @project/ decisions
4. **Task Assignment**: Assign specific @project/ tasks to roles
5. **Milestone Planning**: Plan @project/ development milestones
6. **Parallel Development Planning**: Plan worktree-based parallel development
7. **Sub-Agent Delegation Planning**: Plan task subdivision for sub-agent execution

## Usage Patterns

### Feature Planning

`/plan feature user-authentication`
`/plan implementation dashboard-ui`
`/plan architecture api-redesign`

### Team Coordination

`/plan meeting api-design-review`
`/plan coordination cross-team-dependencies`
`/plan assignment backend jwt-implementation`

### Parallel Development Planning

`/plan parallel user-authentication-system`
`/plan worktrees complex-dashboard-feature`
`/plan sub-agents api-implementation-subdivision`

### Project Management

`/plan milestone mvp-release`
`/plan sprint next-two-weeks`
`/plan roadmap quarterly-goals`

## Response Format

```text
📋 Planning: [Topic]
Project Location: @project/
Planning Date: [timestamp]

## Requirements Alignment
✅ Plan aligns with specifications in @specs/
⚠️ Plan requires specification updates: [details]
❌ Plan conflicts with current @specs/: [explanation]

## Planning Overview
**Scope**: [planning scope for @project/]
**Timeline**: [estimated timeline]
**Resources**: [roles and capacity needed]
**Dependencies**: [internal @project/ and @specs/ dependencies]

## Implementation Plan

### Phase 1: [Phase Name]
- **Objective**: [what this achieves for @project/]
- **Deliverables**: [specific @project/ deliverables]
- **Roles**: [responsible roles]
- **Duration**: [estimated time]

### Phase 2: [Phase Name]
- **Objective**: [what this achieves for @project/]
- **Deliverables**: [specific @project/ deliverables]
- **Roles**: [responsible roles]
- **Duration**: [estimated time]

## Task Assignments

### Immediate Tasks (Next 1-2 Days)
1. **[Role]**: [specific task for @project/]
2. **[Role]**: [specific task for @project/]

### Short-term Tasks (Next Week)
1. **[Role]**: [specific task for @project/]
2. **[Role]**: [specific task for @project/]

### Medium-term Tasks (Next 2-4 Weeks)
1. **[Role]**: [specific task for @project/]
2. **[Role]**: [specific task for @project/]

## Risk Assessment

### 🟢 Low Risk
- [Low risk items for @project/]

### 🟡 Medium Risk
- [Medium risk items for @project/]
- **Mitigation**: [mitigation strategy]

### 🔴 High Risk
- [High risk items for @project/]
- **Impact**: [potential impact on @project/]
- **Mitigation**: [mitigation strategy]

## Success Criteria
- [Criterion 1 for @project/ success]
- [Criterion 2 for @project/ success]
- [Criterion 3 for @project/ success]

## Next Steps
1. [Immediate next step for @project/]
2. [Follow-up action for @project/]
3. [Monitoring requirement for @project/]
```

All planning activities focus on @project/ development and validate against @specs/ requirements.