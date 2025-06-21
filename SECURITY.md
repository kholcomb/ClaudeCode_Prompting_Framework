# Security Policy

## Overview

This repository contains a prompt engineering framework template for Claude Code. As a template/framework rather than executable software, traditional security vulnerabilities are not applicable. However, we take the security of projects built using this framework seriously.

## Scope

This security policy covers:
- The framework template files and structure
- Documentation and examples
- Suggested practices for secure development

This policy does NOT cover:
- Projects built using this framework
- Third-party integrations
- Claude Code itself (see Anthropic's security policies)

## Best Practices for Framework Users

When using this framework for your projects:

### 1. Sensitive Information
- Never commit API keys, passwords, or secrets to your repository
- Use environment variables for sensitive configuration
- Add sensitive files to your project's .gitignore

### 2. CLAUDE.md Instructions
- Be cautious about instructions that could lead to unsafe practices
- Review any custom roles or workflows for security implications
- Avoid instructions that bypass security best practices

### 3. Session State
- The `logs/session-state.json` may contain project information
- Consider adding it to .gitignore if it contains sensitive data
- Regularly clean up old session data

### 4. Dependencies
- When adding dependencies to your project, verify their security
- Use tools like npm audit or pip check
- Keep dependencies updated

## Reporting Security Concerns

If you discover a security concern related to this framework:

1. **DO NOT** create a public issue
2. Contact us through one of these methods:
   - Open a private security advisory on GitHub
   - Email: [your-email@example.com] *(Update this)*

### What to Report

- Unsafe practices in the default framework
- Documentation that could lead to security issues
- Example code with security vulnerabilities
- Suggested improvements for secure development

### What NOT to Report

- Issues with Claude Code itself (report to Anthropic)
- Vulnerabilities in projects using this framework
- General bugs or feature requests (use regular issues)

## Response Process

1. **Acknowledgment**: Within 48 hours
2. **Initial Assessment**: Within 7 days
3. **Resolution**: Depends on severity and complexity
4. **Disclosure**: Coordinated with reporter

## Framework Security Features

This framework promotes security through:

- Organized structure that separates concerns
- Clear documentation practices
- Structured specification templates
- Role-based development workflows
- Contract-based communication patterns

## Version Support

| Version | Supported          |
| ------- | ------------------ |
| 1.x     | :white_check_mark: |
| < 1.0   | :x:                |

## Acknowledgments

We appreciate responsible disclosure and will acknowledge security researchers who help improve this framework.

---

*Remember: This is a template framework. The security of your actual project depends on your implementation choices.*