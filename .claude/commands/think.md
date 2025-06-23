# Think Command

Activates explicit reasoning mode for complex decision-making and architectural choices.

## Purpose

When facing complex problems, architectural decisions, or critical implementations, the think command engages a structured reasoning process to ensure thorough analysis and well-documented decision-making.

## Usage

Invoke when you need:
- Architectural decisions with long-term impact
- Complex problem-solving requiring multiple perspectives
- Critical implementation choices
- Trade-off analysis between different approaches

## Process

### 1. Problem Statement
- Clearly define the problem or decision to be made
- Identify constraints and requirements
- List stakeholders affected by the decision

### 2. Assumption Identification
- List all assumptions being made
- Categorize assumptions by risk level
- Document which assumptions need validation

### 3. Solution Exploration
- Generate multiple potential solutions
- Consider unconventional approaches
- Research industry best practices

### 4. Analysis Framework
For each potential solution:
- **Pros**: Benefits and advantages
- **Cons**: Drawbacks and limitations
- **Risks**: Potential problems and mitigation strategies
- **Complexity**: Implementation and maintenance burden
- **Alignment**: How well it fits with existing architecture

### 5. Decision Documentation
- Chosen approach with clear rationale
- Key factors that influenced the decision
- Rejected alternatives and why
- Success criteria for the implementation

### 6. Risk Mitigation
- Identify potential failure points
- Create contingency plans
- Define monitoring requirements
- Plan validation checkpoints

## Output Format

The reasoning process produces:
```markdown
## Decision: [Title]

### Problem Statement
[Clear description of the problem]

### Assumptions
- [Assumption 1] - Risk: [High/Medium/Low]
- [Assumption 2] - Risk: [High/Medium/Low]

### Options Considered
1. **Option A**: [Description]
   - Pros: [List]
   - Cons: [List]
   - Complexity: [High/Medium/Low]

2. **Option B**: [Description]
   - Pros: [List]
   - Cons: [List]
   - Complexity: [High/Medium/Low]

### Decision
[Chosen option with detailed rationale]

### Risks & Mitigation
- [Risk 1]: [Mitigation strategy]
- [Risk 2]: [Mitigation strategy]

### Success Criteria
- [Measurable outcome 1]
- [Measurable outcome 2]
```

## Example Usage

**Human**: "Let's think through the authentication architecture for this multi-tenant SaaS application."

**Claude**: *Engages think mode*
"I'll analyze the authentication architecture options for your multi-tenant SaaS application.

## Decision: Authentication Architecture for Multi-Tenant SaaS

### Problem Statement
Design a secure, scalable authentication system that supports multiple tenants with isolated data access, SSO capabilities, and role-based permissions.

### Assumptions
- Each tenant needs complete data isolation - Risk: High
- We'll need to support 100+ tenants within 6 months - Risk: Medium
- SSO integration is required for enterprise clients - Risk: Low
- Mobile app support will be needed - Risk: Medium

### Options Considered
1. **JWT with Tenant ID in Claims**
   - Pros: Stateless, scalable, standard approach
   - Cons: Token size, revocation complexity
   - Complexity: Medium

2. **Session-based with Redis**
   - Pros: Easy revocation, smaller cookies
   - Cons: Requires session store, scaling challenges
   - Complexity: Low initially, High at scale

3. **OAuth2 with Custom Authorization Server**
   - Pros: Industry standard, supports all requirements
   - Cons: Higher initial complexity
   - Complexity: High

### Decision
OAuth2 with Custom Authorization Server using JWT access tokens...

[Continues with full analysis]"

## Best Practices

1. **Be Systematic**: Follow all steps even for "obvious" decisions
2. **Document Assumptions**: Every assumption is a potential risk
3. **Consider Maintenance**: Think beyond initial implementation
4. **Seek Alternatives**: Always explore multiple options
5. **Quantify When Possible**: Use metrics and estimates

## Integration with Roles

Each role can use think mode within their domain:
- **Architect**: System design decisions
- **Frontend/Backend**: Implementation approach choices
- **DevOps**: Infrastructure and deployment strategies
- **Security**: Security architecture decisions
- **QA**: Test strategy formulation

---

*The think command ensures critical decisions are made thoughtfully, with full consideration of alternatives and clear documentation of reasoning.*