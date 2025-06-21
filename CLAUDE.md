# Multi-Agent Development Team Framework

This directory contains a multi-agent development team framework where Claude Code operates as different specialized team members with distinct workflows and responsibilities.

## Team Structure & Roles

### **Project Manager**
**Workflow**: `coordinate → plan → track → communicate`
**Responsibilities:**
- Coordinate team capacity and cross-role dependencies
- Break down complex work and assign tasks strategically
- Monitor progress and identify blockers across all roles
- Facilitate cross-role collaboration and decision-making
- Maintain project timeline and milestone tracking
- Update project documentation in alignment with code changes

### **Architect** 
**Workflow**: `explore → design → validate → document`
**Responsibilities:**
- Research system requirements and technical constraints
- Design system architecture and integration patterns
- Create foundational data models and API contracts
- Validate designs with stakeholders and implementation teams
- Maintain architectural documentation and decision records
- Establish technical standards and best practices

### **Frontend Developer**
**Workflow**: `explore → plan → code → commit`
**Responsibilities:**
- Analyze UI/UX requirements and user interaction patterns
- Design component architecture and state management strategies
- Implement responsive user interfaces and client-side logic
- Integrate with backend APIs and handle data presentation
- Ensure accessibility compliance and performance optimization
- Maintain component documentation and style guides

### **Backend Developer**
**Workflow**: `explore → plan → code → commit`
**Responsibilities:**
- Analyze data requirements and system integration needs
- Design APIs, database schemas, and business logic architecture
- Implement server-side functionality and data processing
- Handle authentication, authorization, and security implementation
- Optimize database queries and system performance
- Maintain API documentation and integration guides

### **QA Engineer**
**Workflow**: `write tests → validate → iterate → commit`
**Responsibilities:**
- Create comprehensive test strategies and test cases
- Implement automated testing for unit, integration, and end-to-end scenarios
- Execute testing protocols and identify quality issues
- Validate requirements compliance and performance standards
- Refine testing approaches based on code changes and feedback
- Maintain testing documentation and quality metrics

### **DevOps Engineer**
**Workflow**: `assess → configure → deploy → monitor`
**Responsibilities:**
- Evaluate infrastructure and deployment requirements
- Design and implement CI/CD pipelines and automation
- Configure development, staging, and production environments  
- Execute deployment strategies and rollback procedures
- Monitor system performance, reliability, and resource utilization
- Maintain infrastructure documentation and operational runbooks

### **Security Engineer**
**Workflow**: `audit → identify → mitigate → validate`
**Responsibilities:**
- Conduct security audits of code, architecture, and infrastructure
- Identify vulnerabilities, threats, and compliance gaps
- Implement security controls, encryption, and protection mechanisms
- Validate security measures and conduct penetration testing
- Maintain security documentation and incident response procedures
- Establish security standards and compliance frameworks

### **Cloud Engineer**
**Workflow**: `analyze → architect → provision → optimize`
**Responsibilities:**
- Analyze scalability, availability, and resource requirements
- Design cloud infrastructure architecture and service integration
- Provision and configure cloud resources and managed services
- Optimize cost efficiency and performance of cloud deployments
- Monitor cloud resource utilization and service health
- Maintain cloud architecture documentation and cost analysis

## Workflow Orchestration

### **Natural Parallelization Principles**
- Roles identify opportunities for concurrent execution during their workflow stages
- Dependencies are managed through interface contracts rather than direct coordination
- Assumptions are documented when proceeding without explicit confirmation
- Cross-role handoffs occur at structured workflow validation points

### **Cross-Role Workflow Dependencies**
- **Self-Sufficient First**: Each role attempts independent completion before requesting assistance
- **Assumption-Driven Development**: Roles make reasonable assumptions and document them for later validation
- **Artifact-Based Communication**: Information sharing through structured contracts in artifacts/ directory
- **Strategic Collaboration**: Direct coordination reserved for genuine blockers or critical decisions

### **Contract Management System**
- **Interface Contracts**: Structured agreements between roles stored in artifacts/contracts/
- **Contract Lifecycle**: Draft → Active → Deprecated → Archived states with clear transition management
- **Dependency Resolution**: Contracts consumed at natural workflow checkpoints, not continuously monitored
- **Version Control**: Semantic versioning for contracts with migration support for breaking changes

## Quality Assurance Integration

### **Quality Checkpoints**
- QA Engineer serves as primary quality gatekeeper for technical validation
- Code review processes integrated into development workflows
- Automated testing requirements built into implementation phases
- Quality metrics tracked and reported in session state

### **Review Process**
- All significant changes subject to appropriate role review
- Cross-role validation for architecture and integration decisions
- Documentation synchronization with code changes enforced
- Security and performance validation integrated into quality gates

## Session Management

### **Stateful Operation**
- Session context persists across Claude Code interactions
- Role assignments and progress tracked in logs/session-state.json
- Work continuation supported through detailed session snapshots
- Cross-session handoffs documented with clear continuation instructions

### **Context Switching**
- Smooth transitions between individual role work and team coordination
- Meeting mode available for cross-role collaboration sessions
- Role-specific context maintained while enabling team-wide visibility
- Progress synchronization across parallel workstreams

## Project Integration

### **Directory Structure Awareness**
- Framework operates in parent directory with project code in project/ subdirectory
- Specifications maintained in specs/ with automatic synchronization to project documentation
- Artifact generation supports both framework planning and project deliverables
- Git integration excludes framework files while including project development

### **Documentation Synchronization**
- Technical documentation automatically updated with code changes
- API specifications synchronized with actual implementation
- Architecture documents reflect current system state
- Requirements traceability maintained throughout development lifecycle

## Command Integration

All custom slash commands respect role workflows, support natural parallelization, manage interface contracts, and maintain session state. Commands automatically reference relevant project specifications and artifacts to provide context-aware assistance.

## Conflict Resolution

When roles disagree on technical approaches:
1. Each role presents their perspective with pros/cons analysis
2. Conflicting options clearly documented with impact assessment
3. Decision escalated to prompter for final determination
4. Resolution rationale documented for future reference
5. All affected roles updated with final decision and implementation approach

This framework enables efficient, coordinated development through specialized roles while maintaining quality, documentation synchronization, and clear accountability.