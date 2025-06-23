# GitHub Actions Workflow Templates

This directory contains comprehensive CI/CD workflow templates for different project types using the Multi-Persona Development Framework.

## Available Workflows

### 🏗️ [Framework CI/CD](./framework-ci.yml)
**Purpose**: Validates and maintains the framework itself
- Framework structure validation
- Template testing
- Documentation checks
- Security scanning
- Automated releases

**Usage**: Copy to `.github/workflows/` in the framework repository

### ⚛️ [React CI/CD](./react-ci.yml)
**Purpose**: Complete pipeline for React TypeScript applications
- Multi-Node.js version testing
- Linting, type checking, and testing
- Lighthouse performance testing
- Security audits
- Staging and production deployments

**Usage**: Copy to `project/.github/workflows/` for React projects

### 🟢 [Node.js API CI/CD](./node-api-ci.yml)
**Purpose**: Comprehensive pipeline for Node.js Express APIs
- Database service integration (PostgreSQL, Redis)
- Unit and integration testing
- API testing with Newman/Postman
- Docker image building
- Blue-green deployments

**Usage**: Copy to `project/.github/workflows/` for Node.js API projects

### 🐍 [Python FastAPI CI/CD](./python-fastapi-ci.yml)
**Purpose**: Modern pipeline for Python FastAPI applications
- Multi-Python version testing
- Code quality checks (Black, Flake8, MyPy)
- Security scanning (Bandit, Safety)
- Docker containerization
- Production deployments

**Usage**: Copy to `project/.github/workflows/` for Python projects

## Quick Setup

### 1. For Framework Repository

```bash
# Copy framework CI/CD workflow
cp templates/github-workflows/framework-ci.yml .github/workflows/

# Create markdown link check config
mkdir -p .github
cat > .github/markdown-link-check-config.json << 'EOF'
{
  "ignorePatterns": [
    {
      "pattern": "^http://localhost"
    }
  ],
  "aliveStatusCodes": [200, 206]
}
EOF
```

### 2. For Project Repository

Choose the appropriate workflow for your project type:

```bash
# For React projects
cd project/
mkdir -p .github/workflows
cp ../templates/github-workflows/react-ci.yml .github/workflows/

# For Node.js API projects  
cp ../templates/github-workflows/node-api-ci.yml .github/workflows/

# For Python FastAPI projects
cp ../templates/github-workflows/python-fastapi-ci.yml .github/workflows/
```

## Configuration Requirements

### Environment Variables

Each workflow requires specific environment variables and secrets:

#### React Projects
```bash
# GitHub Secrets to configure:
STAGING_API_URL=https://api-staging.example.com
PRODUCTION_API_URL=https://api.example.com
CODECOV_TOKEN=your-codecov-token
SNYK_TOKEN=your-snyk-token
```

#### Node.js API Projects
```bash
# GitHub Secrets to configure:
DOCKERHUB_USERNAME=your-dockerhub-username
DOCKERHUB_TOKEN=your-dockerhub-token
STAGING_HOST=staging.example.com
STAGING_USERNAME=deploy
STAGING_SSH_KEY=your-ssh-private-key
PRODUCTION_HOST=api.example.com
PRODUCTION_USERNAME=deploy
PRODUCTION_SSH_KEY=your-ssh-private-key
CODECOV_TOKEN=your-codecov-token
SNYK_TOKEN=your-snyk-token
```

#### Python FastAPI Projects
```bash
# GitHub Secrets to configure:
DOCKERHUB_USERNAME=your-dockerhub-username
DOCKERHUB_TOKEN=your-dockerhub-token
STAGING_HOST=staging.example.com
STAGING_USERNAME=deploy
STAGING_SSH_KEY=your-ssh-private-key
PRODUCTION_HOST=api.example.com
PRODUCTION_USERNAME=deploy
PRODUCTION_SSH_KEY=your-ssh-private-key
PRODUCTION_DATABASE_URL=postgresql://user:pass@host:5432/db
PRODUCTION_SECRET_KEY=your-production-secret
```

### Project Configuration Files

#### React Projects

**package.json scripts:**
```json
{
  "scripts": {
    "start": "react-scripts start",
    "build": "react-scripts build", 
    "test": "react-scripts test",
    "lint": "eslint src --ext .ts,.tsx",
    "type-check": "tsc --noEmit"
  }
}
```

**lighthouserc.json:**
```json
{
  "ci": {
    "collect": {
      "staticDistDir": "./build"
    },
    "assert": {
      "assertions": {
        "categories:performance": ["warn", {"minScore": 0.9}],
        "categories:accessibility": ["error", {"minScore": 0.9}]
      }
    }
  }
}
```

#### Node.js API Projects

**package.json scripts:**
```json
{
  "scripts": {
    "start": "node dist/app.js",
    "dev": "nodemon src/app.ts",
    "build": "tsc",
    "test": "jest",
    "test:unit": "jest --testPathPattern=unit",
    "test:integration": "jest --testPathPattern=integration",
    "lint": "eslint src --ext .ts",
    "type-check": "tsc --noEmit",
    "db:migrate": "npx prisma migrate deploy",
    "db:seed:test": "npx prisma db seed -- --env=test"
  }
}
```

**Dockerfile:**
```dockerfile
FROM node:20-alpine
WORKDIR /app
COPY package*.json ./
RUN npm ci --only=production
COPY dist ./dist
EXPOSE 3000
CMD ["npm", "start"]
```

#### Python FastAPI Projects

**requirements-dev.txt:**
```txt
pytest>=7.0.0
pytest-asyncio>=0.21.0
pytest-cov>=4.0.0
black>=23.0.0
isort>=5.12.0
flake8>=6.0.0
mypy>=1.0.0
bandit>=1.7.0
safety>=2.3.0
httpx>=0.24.0
```

**Dockerfile:**
```dockerfile
FROM python:3.11-slim
WORKDIR /app
COPY requirements.txt .
RUN pip install -r requirements.txt
COPY app ./app
EXPOSE 8000
CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "8000"]
```

## Workflow Features

### Common Features (All Workflows)
- ✅ Multi-version testing
- ✅ Code quality checks
- ✅ Security scanning
- ✅ Test coverage reporting
- ✅ Automated deployments
- ✅ Release automation

### React-Specific Features
- ✅ Lighthouse performance testing
- ✅ Bundle size analysis
- ✅ GitHub Pages deployment
- ✅ PR deployment previews

### API-Specific Features (Node.js & Python)
- ✅ Database service integration
- ✅ API endpoint testing
- ✅ Docker image building
- ✅ Health check validation
- ✅ Production smoke tests

### Framework-Specific Features
- ✅ Template validation
- ✅ Documentation link checking
- ✅ Version consistency checks
- ✅ Script syntax validation

## Customization

### Adding New Environments

Add environment-specific jobs:

```yaml
deploy-qa:
  runs-on: ubuntu-latest
  needs: [test, security]
  if: github.ref == 'refs/heads/qa'
  
  environment:
    name: qa
    url: ${{ secrets.QA_API_URL }}
  
  steps:
    # Deployment steps
```

### Adding New Test Types

```yaml
e2e-tests:
  runs-on: ubuntu-latest
  needs: test
  
  steps:
    - name: Run E2E tests
      run: npm run test:e2e
```

### Custom Notifications

```yaml
notify-slack:
  runs-on: ubuntu-latest
  needs: [deploy-production]
  if: always()
  
  steps:
    - name: Slack notification
      uses: 8398a7/action-slack@v3
      with:
        status: ${{ job.status }}
        webhook_url: ${{ secrets.SLACK_WEBHOOK }}
```

## Best Practices

### Security
- Store sensitive data in GitHub Secrets
- Use minimal permissions for deployment keys
- Regularly rotate secrets and tokens
- Scan for vulnerabilities in dependencies

### Performance
- Use matrix strategies for parallel testing
- Cache dependencies between runs
- Use Docker layer caching
- Optimize build times with incremental builds

### Reliability
- Add health checks after deployments
- Implement rollback strategies
- Use smoke tests for critical paths
- Monitor deployment success rates

### Maintenance
- Keep workflow dependencies updated
- Review and update security scanning tools
- Monitor workflow execution times
- Regular cleanup of old artifacts

---

*These GitHub Actions workflows integrate seamlessly with the Multi-Persona Development Framework for automated, high-quality software delivery.*