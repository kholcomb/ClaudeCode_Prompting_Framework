---
allowed-tools: Read(*), Write(*), Edit(*)
description: Dynamically add a new specialized role to the team
---

# Add New Team Role

## Context
- New role: [specified in command]
- Justification: [specified in command]
- Current team structure: @CLAUDE.md
- Active projects: @specs/project-plan.md
- Session state: @logs/session-state.json

## Your Task
Add a new specialized role to the development team:

1. **Role Definition**: Define responsibilities and workflow pattern
2. **Integration Analysis**: Determine how this role fits with existing team
3. **Workflow Design**: Establish role-specific workflow pattern
4. **Contract Relationships**: Identify interface contracts this role will publish/consume
5. **Coordination Strategy**: Define collaboration patterns with other roles

## Role Addition Process

### Role Analysis
- Assess the need and justification for the new role
- Identify gaps in current team coverage
- Determine specialized expertise required
- Evaluate impact on team dynamics and workflows

### Workflow Integration
- Design workflow pattern appropriate for the role
- Identify natural collaboration points with existing roles
- Establish quality checkpoints and review processes
- Define success metrics and deliverables

### Contract Design
- Determine what contracts this role will publish
- Identify contracts this role will consume
- Design interface specifications for role interactions
- Plan contract versioning and evolution strategy

## Response Format
```
➕ New Role Added: [Role Name]
Justification: [reason for adding this role]
Added: [timestamp]
Integration Status: [how well it fits with existing team]

## Role Definition

### 🏷️ Role Identity
**Name**: [Role Name]
**Primary Focus**: [main area of expertise]
**Domain Expertise**: [specific technical or business domain]
**Team Integration**: [how this role complements existing team]

### 🔄 Workflow Pattern
**Pattern**: `[step1] → [step2] → [step3] → [step4]`

**Workflow Stages**:
1. **[Stage 1]**: [description of first workflow stage]
2. **[Stage 2]**: [description of second workflow stage]
3. **[Stage 3]**: [description of third workflow stage]
4. **[Stage 4]**: [description of fourth workflow stage]

### 🏆 Core Responsibilities
- [Primary responsibility 1]
- [Primary responsibility 2]
- [Primary responsibility 3]
- [Primary responsibility 4]
- [Primary responsibility 5]

### 🔗 Contract Relationships

#### Publishes (Creates Contracts)
- **[Contract Type 1]**: [description of contract this role creates]
- **[Contract Type 2]**: [description of another contract]

#### Consumes (Uses Contracts)
- **[Contract Type A]**: [contract this role needs from other roles]
- **[Contract Type B]**: [another contract dependency]

### 🤝 Collaboration Patterns

#### Primary Collaborations
- **With [Role 1]**: [how they work together and when]
- **With [Role 2]**: [collaboration pattern and touchpoints]

#### Secondary Collaborations
- **With [Role 3]**: [occasional collaboration scenarios]
- **With [Role 4]**: [specific project phase collaborations]

### 🎯 Quality Standards
- **Deliverable Quality**: [quality standards for this role's output]
- **Review Process**: [how this role's work gets reviewed]
- **Success Metrics**: [how to measure this role's effectiveness]

## Team Integration Impact

### 📋 Enhanced Capabilities
- [New capability 1 added to team]
- [New capability 2 added to team]
- [Improved coverage of [specific area]]

### 🔄 Workflow Adjustments
- **[Existing Role 1]**: [how their workflow might change]
- **[Existing Role 2]**: [workflow adjustments needed]
- **Overall Team**: [team-wide workflow improvements]

### 🔗 New Contract Requirements

#### Contracts to be Created
- **[New Contract 1]**: [description and purpose]
  - **Publisher**: [New Role]
  - **Consumers**: [list of roles that will use this]
  - **Timeline**: [when this contract will be available]

#### Modified Existing Contracts
- **[Existing Contract]**: [how it needs to be modified]
  - **Changes**: [specific changes required]
  - **Impact**: [roles affected by changes]

## Role Onboarding Plan

### 🚀 Immediate Actions
1. **Context Review**: [what the new role needs to understand immediately]
2. **Current State Assessment**: [what they need to evaluate first]
3. **Initial Tasks**: [first 2-3 tasks to get started]

### 📅 30-Day Integration Plan
- **Week 1**: [focus areas for first week]
- **Week 2**: [focus areas for second week]
- **Week 3**: [focus areas for third week]
- **Week 4**: [focus areas for fourth week]

### 🏁 Success Indicators
- [Indicator 1]: [how to measure successful integration]
- [Indicator 2]: [metric for role effectiveness]
- [Indicator 3]: [team collaboration improvement measure]

## Resource Requirements

### 📊 Workload Distribution
- **Estimated Capacity**: [percentage of total team capacity]
- **Peak Workload Periods**: [when this role will be most busy]
- **Collaboration Time**: [time needed for cross-role work]

### 🔧 Tools & Dependencies
- **Specialized Tools**: [any unique tools this role needs]
- **Access Requirements**: [systems or resources needed]
- **Training Needs**: [any specific knowledge requirements]

## Risk Mitigation

### 🟡 Potential Challenges
- **Integration Risk**: [risk of poor team integration]
  - **Mitigation**: [how to address this risk]
- **Workflow Conflict**: [risk of conflicting with existing workflows]
  - **Mitigation**: [prevention strategy]
- **Communication Overhead**: [risk of increased coordination complexity]
  - **Mitigation**: [strategy to minimize overhead]

### 📈 Success Factors
- [Factor 1]: [what will make this role successful]
- [Factor 2]: [important success element]
- [Factor 3]: [key to effective integration]

---

✅ **Role Addition Complete**

**Summary**: [Role Name] has been successfully integrated into the team structure with defined responsibilities, workflow patterns, and collaboration strategies.

**Next Steps**:
1. Use `/project:assign [new-role] [initial-task]` to begin work
2. Run `/project:list-roles` to see updated team structure
3. Consider `/project:meeting team-integration` to align all roles

**Team Size**: Now [count] specialized roles working collaboratively
```

Update CLAUDE.md to include the new role definition and update session state with the expanded team structure.