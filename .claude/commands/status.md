---
allowed-tools: Read(*), Bash(*)
description: Provide current project status across all team roles
---

# Project Status Report

## Context
- Current session state: @logs/session-state.json
- Project specifications: @specs/project-plan.md
- Recent activity logs: !`find logs -name "*.log" -mtime -1 | head -5 | xargs tail -n 20`

## Your Task
Generate a comprehensive status report showing:

1. **Role-Specific Progress**: Current workflow stage for each active role
2. **Task Completion**: Completed, in-progress, and pending tasks
3. **Dependency Status**: Blocking and non-blocking dependencies
4. **Contract Health**: New, updated, deprecated contracts
5. **Quality Gates**: Passed and pending quality checkpoints
6. **Resource Utilization**: Role workload distribution

## Response Format
```
📈 Project Status Report
Generated: [timestamp]
Project Phase: [current phase]

## Role Status
📋 **Project Manager**
  Current Stage: [workflow stage]
  Active Tasks: [task count]
  Blockers: [blocker count]

🏢 **Architect** 
  Current Stage: [workflow stage]
  Active Tasks: [task count]
  Published Contracts: [contract count]
  
🎨 **Frontend Developer**
  Current Stage: [workflow stage]
  Active Tasks: [task count]
  Code Commits: [recent activity]
  
⚙️ **Backend Developer**
  Current Stage: [workflow stage]
  Active Tasks: [task count]
  API Endpoints: [status]
  
🧪 **QA Engineer**
  Current Stage: [workflow stage]
  Tests Written: [count]
  Quality Gates: [passed/pending]
  
🚀 **DevOps Engineer**
  Current Stage: [workflow stage]
  Deployments: [status]
  Infrastructure: [health]
  
🛡️ **Security Engineer**
  Current Stage: [workflow stage]
  Audits: [completed/pending]
  Vulnerabilities: [status]
  
☁️ **Cloud Engineer**
  Current Stage: [workflow stage]
  Resources: [utilization]
  Cost Optimization: [status]

## Overall Progress
Completed: [X]% 
Critical Path: [longest dependency chain]
Next Milestone: [upcoming milestone]

## Contract Updates
🆕 New: [new contracts]
🔄 Updated: [updated contracts] 
⚠️ Deprecated: [deprecated contracts]

## Blockers & Risks
🚨 Critical: [critical blockers]
⚠️ Medium: [medium risks]
📅 Upcoming: [potential issues]
```