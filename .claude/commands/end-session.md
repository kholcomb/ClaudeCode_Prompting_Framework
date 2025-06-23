---
allowed-tools: Read(*), Write(*), Bash(cd project && *)
description: Provide session summary with continuation prompts focused on @project/
---

# End Session Summary

## Context

- Project specifications: @specs/ directory
- Project source code: @project/src/ directory
- Project tests: @project/tests/ directory
- Project documentation: @project/docs/ directory
- Project configuration: @project/config/ directory
- Session work completed on @project/

## Your Task

Provide comprehensive session closure with continuation guidance:

**IMPORTANT**: Session summary must focus on @project/ work and validate against requirements:

1. **Project Work Summary**: Overview of @project/ changes completed during this session
2. **Requirements Compliance**: How session work aligns with @specs/ directory
3. **Role-Specific Status**: Current state and context for work on @project/
4. **Continuation Prompts**: Specific prompts to resume @project/ work effectively
5. **Priority Actions**: Next most important actions for @project/ development

## Session Closure Process

### Work Completion Assessment
- Summarize tasks completed during session
- Identify work left in progress
- Document assumptions and decisions made
- Record any blockers or dependencies

### Role Context Capture
- Current workflow stage for each role
- Active tasks and their status
- Key decisions or discoveries
- Next logical steps in their workflow

### Continuation Planning
- Priority order for resuming work
- Role-specific context needed to continue
- Dependencies that need attention
- Critical timelines or deadlines

## Response Format

```text
🏁 Session End Summary
Session Duration: [start time] - [end time]
Project Location: @project/
Generated: [timestamp]

## Requirements Validation
✅ Session work aligns with @specs/ requirements
⚠️ Some work may need specification updates: [details]
❌ Session work conflicts with current @specs/: [explanation]

## Session Overview

### 🏆 Accomplishments in @project/
- [Major accomplishment 1 in @project/]
- [Major accomplishment 2 in @project/]
- [Major accomplishment 3 in @project/]

### 📈 Progress Made on @project/
- **Code Changes**: [summary of @project/src/ work]
- **Tests Added**: [summary of @project/tests/ work]
- **Documentation**: [updates to @project/docs/]
- **Configuration**: [changes to @project/config/]

### 🔄 Work in Progress
- [In-progress item 1] - [percentage complete]
- [In-progress item 2] - [percentage complete]
- [In-progress item 3] - [percentage complete]

## Role Status & Continuation

### 📋 Project Manager
**Current Status**: [workflow stage and current focus]
**Active Tasks**: [list of active PM tasks]
**Next Actions**: [immediate next steps]
**Context for Continuation**:
```
To continue as Project Manager:
"I need to [specific action] focusing on [specific area]. 
The current priority is [priority item] because [reasoning]. 
Key coordination needed with [roles] regarding [topic]."
```
**Estimated Time to Resume**: [time needed to get back up to speed]

### 🏢 Architect
**Current Status**: [workflow stage and current focus]
**Active Tasks**: [list of active architect tasks]
**Decisions Made**: [key architectural decisions this session]
**Context for Continuation**:
```
To continue as Architect:
"I was working on [specific design/architecture task]. 
The current design approach is [approach] based on [constraints/requirements]. 
Next I need to [specific technical action] and validate [specific aspect]."
```
**Published Contracts**: [contracts published this session]
**Estimated Time to Resume**: [time needed to get back up to speed]

### 🎨 Frontend Developer
**Current Status**: [workflow stage and current focus on @project/]
**Active Tasks**: [list of active frontend tasks in @project/src/]
**Code Progress**: [summary of frontend work in @project/]
**Context for Continuation**:
```
To continue as Frontend Developer:
"I was implementing [specific feature/component] in @project/src/[directory]/. 
The current approach uses [technology/pattern] and integrates with [API/service]. 
Next I need to [specific development task] and test [specific functionality]."
```
**Dependencies**: [waiting on @specs/ updates or other @project/ components]
**Estimated Time to Resume**: [time needed to get back up to speed]

### ⚙️ Backend Developer
**Current Status**: [workflow stage and current focus on @project/]
**Active Tasks**: [list of active backend tasks in @project/src/]
**API Progress**: [summary of API development in @project/]
**Context for Continuation**:
```
To continue as Backend Developer:
"I was developing [specific API/service/feature] in @project/src/[directory]/. 
The implementation uses [technology/framework] and handles [specific functionality]. 
Next I need to [specific development task] and integrate with [system/service]."
```
**Database Changes**: [any schema or data changes in @project/]
**Estimated Time to Resume**: [time needed to get back up to speed]

### 🧪 QA Engineer
**Current Status**: [workflow stage and current focus on @project/tests/]
**Active Tasks**: [list of active QA tasks for @project/]
**Testing Progress**: [summary of testing work in @project/tests/]
**Context for Continuation**:
```
To continue as QA Engineer:
"I was testing [specific feature/component] in @project/tests/[directory]/ using [testing approach]. 
Current test coverage is [status] and I identified [findings]. 
Next I need to [specific testing task] and validate [specific requirements]."
```
**Quality Issues**: [any quality concerns identified in @project/]
**Estimated Time to Resume**: [time needed to get back up to speed]

### 🚀 DevOps Engineer
**Current Status**: [workflow stage and current focus]
**Active Tasks**: [list of active DevOps tasks]
**Infrastructure Changes**: [summary of infrastructure work]
**Context for Continuation**:
```
To continue as DevOps Engineer:
"I was configuring [specific infrastructure/pipeline]. 
The current setup handles [specific requirements] using [technology/service]. 
Next I need to [specific infrastructure task] and monitor [specific metrics]."
```
**Deployment Status**: [current deployment state]
**Estimated Time to Resume**: [time needed to get back up to speed]

### 🛡️ Security Engineer
**Current Status**: [workflow stage and current focus]
**Active Tasks**: [list of active security tasks]
**Security Reviews**: [summary of security work]
**Context for Continuation**:
```
To continue as Security Engineer:
"I was auditing [specific component/system] for [security concerns]. 
Found [security findings] and recommended [security measures]. 
Next I need to [specific security task] and validate [security controls]."
```
**Security Findings**: [any security issues identified]
**Estimated Time to Resume**: [time needed to get back up to speed]

### ☁️ Cloud Engineer
**Current Status**: [workflow stage and current focus]
**Active Tasks**: [list of active cloud tasks]
**Cloud Resources**: [summary of cloud work]
**Context for Continuation**:
```
To continue as Cloud Engineer:
"I was optimizing [specific cloud resource/service]. 
Current configuration handles [specific requirements] with [cost/performance profile]. 
Next I need to [specific cloud task] and monitor [specific metrics]."
```
**Resource Changes**: [any cloud resource modifications]
**Estimated Time to Resume**: [time needed to get back up to speed]

## Critical Handoff Information

### 🚨 Immediate Attention Needed
- [Critical item 1 requiring immediate attention]
- [Critical item 2 requiring immediate attention]

### 🔗 Cross-Role Dependencies
- [Role A] waiting on [Role B] for [specific deliverable]
- [Role C] needs input from [Role D] about [specific decision]

### 📅 Time-Sensitive Items
- [Item 1] - deadline: [date/time]
- [Item 2] - deadline: [date/time]

### 📝 Key Assumptions Made
- [Assumption 1] - needs validation with [stakeholder/role]
- [Assumption 2] - impacts [specific area]

## Contract Status

### 🆕 New Contracts Created
- [Contract name] - [version] - [purpose]

### 🔄 Contracts Updated
- [Contract name] - [old version] → [new version] - [changes]

### ⚠️ Contract Migration Needed
- [Contract name] - [roles affected] - [migration timeline]

## Recommended Next Session Start

### 🏁 Priority Order
1. **First**: [highest priority action] - [responsible role]
2. **Second**: [second priority action] - [responsible role]
3. **Third**: [third priority action] - [responsible role]

### 🚀 Quick Start Command
```
Recommended first command for next session:
/project:assign [role] [specific task based on current priorities]
```

### 🔄 Session Restoration
```
To restore this session context:
/project:session load [session-id]
```

---

🎆 **Session Complete**
Total productive work completed across [count] roles
Session state saved for seamless continuation
Next session ready to resume with clear priorities and context
```

Save session state to logs/session-state.json with all role contexts and continuation information.