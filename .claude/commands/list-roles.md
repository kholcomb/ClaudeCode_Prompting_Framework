---
allowed-tools: Read(*)
description: Display all currently active team roles and their status
---

# Team Roles Overview

## Context
- Current team structure: @CLAUDE.md
- Session state: @logs/session-state.json
- Active assignments and role status

## Your Task
Display comprehensive overview of all active team roles:

1. **Role Inventory**: List all currently defined roles
2. **Status Summary**: Current activity status for each role
3. **Workflow States**: Where each role is in their workflow pattern
4. **Capability Matrix**: Overview of team capabilities and coverage
5. **Workload Distribution**: Current task allocation across roles

## Response Format
```
👥 Active Team Roles
Team Size: [count] specialized roles
Generated: [timestamp]

## Core Team Roles

### 📋 Project Manager
**Workflow**: `coordinate → plan → track → communicate`
**Current Stage**: [current workflow stage]
**Active Tasks**: [count] tasks assigned
**Status**: [Active/Idle/Blocked]
**Primary Focus**: [current main responsibility]
**Key Expertise**: Project coordination, resource management, timeline tracking

### 🏢 Architect
**Workflow**: `explore → design → validate → document`
**Current Stage**: [current workflow stage]
**Active Tasks**: [count] tasks assigned
**Status**: [Active/Idle/Blocked]
**Primary Focus**: [current main responsibility]
**Key Expertise**: System design, technical patterns, integration architecture

### 🎨 Frontend Developer
**Workflow**: `explore → plan → code → commit`
**Current Stage**: [current workflow stage]
**Active Tasks**: [count] tasks assigned
**Status**: [Active/Idle/Blocked]
**Primary Focus**: [current main responsibility]
**Key Expertise**: UI/UX implementation, client-side optimization, component architecture

### ⚙️ Backend Developer
**Workflow**: `explore → plan → code → commit`
**Current Stage**: [current workflow stage]
**Active Tasks**: [count] tasks assigned
**Status**: [Active/Idle/Blocked]
**Primary Focus**: [current main responsibility]
**Key Expertise**: Server-side logic, API development, database design, business logic

### 🧪 QA Engineer
**Workflow**: `write tests → validate → iterate → commit`
**Current Stage**: [current workflow stage]
**Active Tasks**: [count] tasks assigned
**Status**: [Active/Idle/Blocked]
**Primary Focus**: [current main responsibility]
**Key Expertise**: Quality assurance, test automation, bug detection, quality metrics

### 🚀 DevOps Engineer
**Workflow**: `assess → configure → deploy → monitor`
**Current Stage**: [current workflow stage]
**Active Tasks**: [count] tasks assigned
**Status**: [Active/Idle/Blocked]
**Primary Focus**: [current main responsibility]
**Key Expertise**: CI/CD pipelines, infrastructure automation, deployment strategies

### 🛡️ Security Engineer
**Workflow**: `audit → identify → mitigate → validate`
**Current Stage**: [current workflow stage]
**Active Tasks**: [count] tasks assigned
**Status**: [Active/Idle/Blocked]
**Primary Focus**: [current main responsibility]
**Key Expertise**: Security auditing, vulnerability assessment, compliance, threat mitigation

### ☁️ Cloud Engineer
**Workflow**: `analyze → architect → provision → optimize`
**Current Stage**: [current workflow stage]
**Active Tasks**: [count] tasks assigned
**Status**: [Active/Idle/Blocked]
**Primary Focus**: [current main responsibility]
**Key Expertise**: Cloud architecture, scalability, cost optimization, managed services

## Additional Specialized Roles
[If any roles have been added via /project:add-role, list them here with same format]

### 🏷️ [Additional Role Name]
**Workflow**: `[custom workflow pattern]`
**Current Stage**: [current workflow stage]
**Active Tasks**: [count] tasks assigned
**Status**: [Active/Idle/Blocked]
**Primary Focus**: [current main responsibility]
**Key Expertise**: [specialized expertise areas]

## Team Capability Matrix

| Capability Area | Primary Role | Supporting Roles | Coverage |
|----------------|--------------|------------------|----------|
| Project Management | PM | All roles | ✅ Complete |
| Architecture & Design | Architect | Frontend, Backend | ✅ Complete |
| Frontend Development | Frontend | Architect, QA | ✅ Complete |
| Backend Development | Backend | Architect, QA | ✅ Complete |
| Quality Assurance | QA | All developers | ✅ Complete |
| Infrastructure | DevOps | Cloud, Security | ✅ Complete |
| Security & Compliance | Security | DevOps, All roles | ✅ Complete |
| Cloud & Scalability | Cloud | DevOps, Architect | ✅ Complete |
[Additional capabilities if specialized roles added]

## Workload Distribution

### 📈 Current Allocation
- **Optimal Load**: [count] roles operating at ideal capacity
- **Under-utilized**: [count] roles with available capacity
- **At Capacity**: [count] roles fully allocated
- **Over-allocated**: [count] roles with excessive workload

### 🔄 Resource Optimization Opportunities
- [Suggestion 1 for better workload distribution]
- [Suggestion 2 for capacity utilization]
- [Suggestion 3 for workflow efficiency]

## Cross-Role Dependencies

### 🔗 Active Dependencies
- **[Role A]** waiting on **[Role B]** for [deliverable]
- **[Role C]** coordinating with **[Role D]** on [shared work]

### 📅 Upcoming Coordination Needs
- [Anticipated collaboration requirement 1]
- [Anticipated collaboration requirement 2]

## Team Health Indicators

### 🟢 Healthy Indicators
- [Positive team dynamic indicator]
- [Good collaboration pattern]
- [Effective workflow execution]

### 🟡 Areas for Attention
- [Potential improvement area]
- [Coordination challenge to address]

### 🔴 Immediate Concerns
- [Any urgent team coordination issues]
- [Resource allocation problems]

## Communication Patterns

### 🗺️ Primary Communication Flows
- **PM ↔️ All Roles**: Coordination and status updates
- **Architect ↔️ Developers**: Technical design and implementation
- **QA ↔️ Developers**: Quality validation and testing
- **DevOps ↔️ Developers**: Deployment and infrastructure
- **Security ↔️ All Roles**: Security review and compliance

### 📢 Meeting Patterns
- **All Hands**: [frequency] for project alignment
- **Technical Review**: [frequency] for architecture and design
- **Quality Review**: [frequency] for QA and testing
- **Operations Review**: [frequency] for DevOps and deployment

## Role Management Commands

### 🚀 Quick Actions
- **Assign Work**: `/project:assign [role] [task]`
- **Check Status**: `/project:status` for detailed progress
- **Add Role**: `/project:add-role [new-role] [justification]`
- **Team Meeting**: `/project:meeting [topic]`
- **Get Feedback**: `/project:feedback [role] [topic]`

---

🎆 **Team Overview Complete**
Total: [count] active roles providing comprehensive project coverage
Team Status: [Overall team health assessment]
Recommendation: [Any team optimization suggestions]
```

Provide actionable insights about team composition, workload distribution, and collaboration effectiveness.