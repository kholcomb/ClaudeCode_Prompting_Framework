---
allowed-tools: Read(*), Write(*), Edit(*)
description: Facilitate cross-role team meeting on specific topic
---

# Team Meeting Facilitation

## Context
- Meeting topic: [specified in command]
- Current project context: @specs/requirements.md @specs/architecture.md @specs/project-plan.md
- Session state: @logs/session-state.json
- Active contracts: @artifacts/contracts/

## Your Task
Facilitate a collaborative team meeting involving relevant roles based on the topic:

1. **Determine Attendees**: Identify which roles need to participate based on topic
2. **Agenda Setting**: Structure discussion points and decision items
3. **Cross-Role Coordination**: Enable different perspectives to be heard
4. **Decision Documentation**: Capture decisions and action items
5. **Follow-up Planning**: Assign next steps and responsibilities

## Response Format
```
🏢 Team Meeting: [Topic]
Date: [timestamp]
Facilitator: Project Manager

## Attendees
📋 Present: [List of relevant roles for this topic]
🔇 Optional: [Roles that may contribute if needed]

## Agenda
1. Context Review
2. Current State Assessment  
3. Key Discussion Points
4. Decision Items
5. Action Planning

---

## Context Review
[Brief summary of current situation relevant to topic]

## Role Perspectives

### 📋 Project Manager
[PM perspective on coordination, timeline, resource implications]

### 🏢 Architect
[Technical architecture considerations and constraints]

### 🎨 Frontend Developer  
[UI/UX implementation perspective and requirements]

### ⚙️ Backend Developer
[Server-side implementation and data considerations]

### 🧪 QA Engineer
[Quality implications and testing requirements]

### 🚀 DevOps Engineer
[Infrastructure and deployment considerations]

### 🛡️ Security Engineer
[Security implications and compliance requirements]

### ☁️ Cloud Engineer
[Scalability and cloud architecture considerations]

## Key Discussion Points
1. 📝 [Discussion point 1]
   - [Role A viewpoint]
   - [Role B viewpoint]
   - [Synthesis/common ground]

2. 📝 [Discussion point 2]
   - [Analysis and different perspectives]

## Decisions Needed
🤔 **Decision 1**: [Decision description]
- Option A: [pros/cons]
- Option B: [pros/cons]
- **Recommendation**: [Team consensus or need for prompter input]

🤔 **Decision 2**: [Decision description]
- [Analysis and recommendation]

## Action Items
| Role | Action | Due Date | Dependencies |
|------|--------|----------|-------------|
| [Role] | [Action description] | [Date] | [Dependencies] |
| [Role] | [Action description] | [Date] | [Dependencies] |

## Contracts Impact
- **New Contracts**: [Contracts that need to be created]
- **Updated Contracts**: [Contracts requiring updates]
- **Dependencies**: [Cross-role contract dependencies]

## Follow-up
- Next meeting: [If needed]
- Progress check: [Timeline]
- Escalation items: [Items requiring prompter decision]

---

📄 **Meeting Summary**
[Concise summary of key outcomes and next steps]
```

Update session state with meeting outcomes and new task assignments.