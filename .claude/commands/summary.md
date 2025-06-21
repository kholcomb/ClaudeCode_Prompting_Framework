---
allowed-tools: Read(*), Bash(*)
description: Provide high-level project progress summary
---

# Project Summary

## Context
- Project specifications: @specs/requirements.md @specs/project-plan.md
- Current session: @logs/session-state.json
- Recent progress: !`find artifacts -name "*.md" -mtime -7 | wc -l` artifacts updated this week
- Code activity: !`cd project && git log --oneline --since="1 week ago" | wc -l` commits this week

## Your Task
Provide a concise, executive-level summary of project status:

1. **High-Level Progress**: Overall completion and milestone status
2. **Key Accomplishments**: Major deliverables completed recently
3. **Current Focus**: What the team is actively working on
4. **Upcoming Milestones**: Next major deliverables and timeline
5. **Resource Status**: Team utilization and capacity
6. **Risk Assessment**: Key challenges and mitigation strategies

## Response Format
```
📈 Project Summary
Project: [Project Name]
Reporting Period: [Time period]
Generated: [timestamp]

## Executive Overview
🏆 **Overall Status**: [On Track/At Risk/Behind Schedule]
📈 **Progress**: [X]% complete ([X] of [Y] milestones)
📅 **Timeline**: [Current phase] - [estimated completion]
💰 **Budget/Resources**: [Within budget/resource utilization]

## Key Accomplishments
✅ **Completed This Period**:
- [Major deliverable 1] - [completion date]
- [Major deliverable 2] - [completion date]
- [Major deliverable 3] - [completion date]

🎆 **Major Milestones Achieved**:
- [Milestone 1]: [achievement description]
- [Milestone 2]: [achievement description]

## Current Focus Areas

🔥 **Active Development**:
- [Current major initiative 1]
- [Current major initiative 2]
- [Current major initiative 3]

📋 **Team Activities**:
- **Frontend**: [current focus]
- **Backend**: [current focus]
- **QA**: [current focus]
- **DevOps**: [current focus]
- **Security**: [current focus]
- **Cloud**: [current focus]

## Upcoming Milestones

🏁 **Next 30 Days**:
- [Milestone 1] - [target date]
- [Milestone 2] - [target date]

📅 **Next Quarter**:
- [Major milestone 1] - [target timeframe]
- [Major milestone 2] - [target timeframe]

## Metrics Dashboard

📈 **Development Metrics**:
- Code Commits: [count] this week
- Features Completed: [count] this sprint
- Bugs Resolved: [count] this period
- Test Coverage: [percentage]

📁 **Project Health**:
- Requirements Stability: [High/Medium/Low]
- Technical Debt: [manageable level]
- Team Velocity: [trending up/stable/down]
- Quality Metrics: [passing/attention needed]

## Risk Assessment

🟢 **Low Risk**:
- [Risk item with good mitigation]

🟡 **Medium Risk**:
- [Risk item requiring monitoring]
- **Mitigation**: [mitigation strategy]

🔴 **High Risk**:
- [Critical risk requiring attention]
- **Impact**: [potential impact]
- **Mitigation**: [action plan]

## Resource Utilization

📋 **Team Capacity**:
- Optimal Load: [count] roles operating at optimal capacity
- Under-utilized: [count] roles with additional capacity
- Over-utilized: [count] roles requiring support

🔄 **Resource Optimization**:
- [Recommendation for better resource allocation]
- [Suggested adjustments to workload distribution]

## Strategic Insights

💡 **Key Learnings**:
- [Important insight gained during this period]
- [Process improvement identified]

🏆 **Success Factors**:
- [What's working well]
- [Practices to continue]

🔧 **Improvement Opportunities**:
- [Area for enhancement]
- [Recommended changes]

## Stakeholder Communication

📢 **Key Messages**:
- [Important update for stakeholders]
- [Achievement to highlight]
- [Any concerns to communicate]

📅 **Next Report**: [When next summary will be provided]

---

📄 **Summary**: [One-paragraph executive summary of current status, key achievements, and immediate priorities]
```

Focus on actionable insights and clear communication of status to support decision-making.