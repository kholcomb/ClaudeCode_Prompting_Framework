# Efficient Command
<!-- Version: 1.1.0 -->

Enables token-efficient response mode for long sessions and repetitive tasks.

## Purpose

The efficient command optimizes Claude's responses to use fewer tokens while maintaining essential information. This is crucial for:
- Long development sessions approaching context limits
- Repetitive tasks with established patterns
- Rapid prototyping where code matters more than explanation
- Multiple file operations in sequence

## Usage

Activate efficient mode when:
- Session exceeds 50% of context window
- Working on well-understood tasks
- Implementing multiple similar features
- Making repetitive edits across files
- Context window warnings appear

## Features

### Response Optimization
- **Concise Communication**: Direct answers without elaborate explanations
- **Bullet Points**: Use lists instead of paragraphs
- **Code-First**: Show implementation with minimal commentary
- **Smart Abbreviation**: Use common abbreviations and shorter phrases

### Context Preservation
- Critical information retained
- Active contracts and dependencies tracked
- Current task context maintained
- Assumptions and decisions preserved

### Automatic Behaviors
- Suggest context pruning when beneficial
- Summarize completed work into single lines
- Reference files by path instead of content
- Group similar operations

## Response Patterns

### Normal Mode
```
I'll implement the user authentication feature. First, let me explore the 
existing codebase to understand the current patterns and identify where 
to add the new functionality. I'll check for any existing auth-related 
code and examine the project structure...

[Multiple paragraphs of explanation]
```

### Efficient Mode
```
Implementing user auth:
- Found existing patterns in /src/lib
- Adding JWT-based auth
- Files to modify: auth.js, middleware.js, user.model.js

[Shows code directly]
```

## Example Usage

**Human**: "Switch to efficient mode - we have a lot to implement today"

**Claude**: 
```
✓ Efficient mode active
- Concise responses
- Code-focused
- Context preserved
Ready for rapid development.
```

**Human**: "Add CRUD operations for the Product model"

**Claude**:
```
Creating Product CRUD:

[Creates model, controller, routes, tests - minimal explanation]
✓ Product model: /models/product.js
✓ Controller: /controllers/product.js  
✓ Routes: /routes/product.js
✓ Tests: /tests/product.test.js

Next steps?
```

## Compression Strategies

### 1. Code Without Commentary
Show implementation directly unless explanation specifically requested.

### 2. Status Updates
Replace:
> "I've successfully created the user authentication middleware with JWT token validation, error handling, and role-based access control. The middleware is now ready to be integrated into your routes."

With:
> "✓ Auth middleware created with JWT, error handling, RBAC"

### 3. File References
Replace:
> "Looking at the file /src/components/UserList.jsx, I can see that..."

With:
> "In UserList.jsx:"

### 4. Task Completion
Replace verbose completion messages with:
- "✓ Done"
- "✓ Tests passing"
- "✓ 5 files updated"

## Context Management Integration

Efficient mode works with context management to:
- Track context usage percentage
- Suggest when to archive completed work
- Automatically compress old task summaries
- Maintain critical information density

## Switching Modes

### Activate
- "Switch to efficient mode"
- "Enable efficient responses"
- "Use efficient mode"

### Deactivate  
- "Switch to normal mode"
- "Use detailed responses"
- "Exit compact mode"

### Temporary Override
- "Explain this in detail" - Single detailed response
- "Give me a summary" - Single efficient response

## Best Practices

1. **Use for Known Patterns**: Most effective for familiar tasks
2. **Combine with Clear Requests**: Be specific about what you need
3. **Monitor Context Usage**: Check session state periodically
4. **Archive Completed Work**: Move finished tasks to logs
5. **Keep Critical Info**: Never compress active decisions or blockers

## Role-Specific Efficient Patterns

### Developer Roles
- Show code with minimal explanation
- List files modified
- Use standard commit messages

### Architect Role
- Bullet point designs
- Reference existing patterns
- Link to contracts

### DevOps Role
- Command sequences
- Configuration snippets
- Status indicators

### QA Role
- Test results summary
- Pass/fail indicators
- Critical issues only

---

*Efficient mode maximizes productivity in long sessions while preserving essential information and context.*