---
allowed-tools: Read(*), Grep(*), Glob(*)
description: Request honest feedback and recommendations from specific role or all roles
---

# Honest Feedback Request

## Context
- Target role: [specified in command - single role or "all"]
- Topic/focus area: [specified in command]
- Current project state: @specs/requirements.md @specs/project-plan.md
- Recent progress: @logs/session-state.json

## Your Task
Provide candid, constructive feedback from the perspective of the specified role(s):

1. **Role-Specific Assessment**: Evaluate from domain expertise perspective
2. **Risk Analysis**: Identify concerns, risks, and potential issues
3. **Alternative Approaches**: Suggest different ways to tackle challenges
4. **Resource Optimization**: Consider efficiency and resource allocation
5. **Cross-Role Impact**: Assess implications for other team members

## Response Format

### Single Role Feedback
```
🗣️ Honest Feedback: [Topic]
Role: [Specific Role]
Perspective: [Role's domain expertise]

## Current Assessment
[Frank evaluation of current state from role's viewpoint]

## Concerns & Risks
🚨 Critical: [High-impact risks]
⚠️ Medium: [Moderate concerns] 
📅 Future: [Potential long-term issues]

## Recommendations
🔥 Immediate Actions:
1. [Urgent action item 1]
2. [Urgent action item 2]

🏁 Long-term Improvements:
1. [Strategic improvement 1]
2. [Strategic improvement 2]

## Alternative Approaches
🔄 Option A: [Alternative approach with pros/cons]
🔄 Option B: [Different approach with trade-offs]

## Success Metrics
[How to measure improvement and success]

## Resource Impact
[Time, effort, and resource implications]
```

### Multi-Role Feedback (when "all" specified)
```
🗣️ Team Feedback: [Topic]

## Project Manager Perspective
[PM feedback focusing on coordination, timeline, resources]

## Architect Perspective  
[Technical architecture and design concerns]

## Frontend Developer Perspective
[UI/UX and client-side implementation feedback]

## Backend Developer Perspective
[Server-side and data architecture feedback]

## QA Engineer Perspective
[Quality, testing, and reliability concerns]

## DevOps Engineer Perspective
[Infrastructure, deployment, and operational feedback]

## Security Engineer Perspective
[Security, compliance, and risk assessment]

## Cloud Engineer Perspective
[Scalability, cost, and cloud architecture feedback]

## Consensus Recommendations
✅ Agreed Actions: [Items all roles agree on]
⚙️ Conflicting Views: [Areas of disagreement requiring decision]
🏆 Priority Focus: [Top 3 areas needing attention]
```

Be direct and honest - focus on constructive criticism that helps improve outcomes.