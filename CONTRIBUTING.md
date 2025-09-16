# Contributing to Metabase Helm Chart

Thank you for your interest in contributing to the Metabase Helm Chart! This document provides guidelines and information for contributors.

## 🚀 Getting Started

### Prerequisites

- [Helm](https://helm.sh/docs/intro/install/) 3.0+
- [Kubernetes](https://kubernetes.io/docs/setup/) 1.19+
- [Docker](https://docs.docker.com/get-docker/) (for testing)
- [Git](https://git-scm.com/downloads)

### Development Setup

1. **Fork the repository**
   ```bash
   git clone https://github.com/your-username/metabase-helm-chart.git
   cd metabase-helm-chart
   ```

2. **Create a development branch**
   ```bash
   git checkout -b feature/your-feature-name
   ```

3. **Make your changes**
   - Edit the appropriate files
   - Test your changes thoroughly

4. **Test your changes**
   ```bash
   # Validate templates
   helm template metabase ./charts/metabase --debug
   
   # Test with different configurations
   helm template metabase ./charts/metabase -f charts/metabase/values-smartway.yaml --debug
   ```

## 📝 Contribution Guidelines

### Code Style

- Use consistent YAML formatting (2 spaces for indentation)
- Follow Helm best practices
- Add comments for complex template logic
- Use descriptive variable names

### Commit Messages

Follow the [Conventional Commits](https://www.conventionalcommits.org/) specification:

```
type(scope): description

[optional body]

[optional footer(s)]
```

**Types:**
- `feat`: New feature
- `fix`: Bug fix
- `docs`: Documentation changes
- `style`: Code style changes
- `refactor`: Code refactoring
- `test`: Adding or updating tests
- `chore`: Maintenance tasks

**Examples:**
```
feat(config): add support for custom environment variables
fix(deployment): resolve service account template issue
docs(readme): update installation instructions
```

### Pull Request Process

1. **Create a feature branch** from `main`
2. **Make your changes** following the guidelines above
3. **Test thoroughly** with different configurations
4. **Update documentation** if needed
5. **Create a pull request** with a clear description

### Pull Request Template

```markdown
## Description
Brief description of the changes

## Type of Change
- [ ] Bug fix
- [ ] New feature
- [ ] Breaking change
- [ ] Documentation update

## Testing
- [ ] Tested with default values
- [ ] Tested with Smartway values
- [ ] Tested with custom values
- [ ] Updated documentation

## Checklist
- [ ] Code follows the project's style guidelines
- [ ] Self-review completed
- [ ] Documentation updated
- [ ] No breaking changes (or clearly documented)
```

## 🧪 Testing

### Template Validation

```bash
# Basic template validation
helm template metabase ./charts/metabase --debug

# Test with different value files
helm template metabase ./charts/metabase -f charts/metabase/values-smartway.yaml --debug
helm template metabase ./charts/metabase -f examples/production.yaml --debug
```

### Dry Run Testing

```bash
# Test installation without actually installing
helm install metabase ./charts/metabase --dry-run --debug
```

### Linting

```bash
# Use helm lint if available
helm lint ./charts/metabase
```

## 📚 Documentation

### Updating Documentation

- Update `README.md` for user-facing changes
- Update `CHANGELOG.md` for version changes
- Add examples in the `examples/` directory
- Update inline comments in templates

### Documentation Standards

- Use clear, concise language
- Include code examples where helpful
- Keep examples up-to-date with the code
- Use proper markdown formatting

## 🐛 Bug Reports

When reporting bugs, please include:

1. **Helm version**: `helm version`
2. **Kubernetes version**: `kubectl version`
3. **Chart version**: The version you're using
4. **Steps to reproduce**: Clear, numbered steps
5. **Expected behavior**: What should happen
6. **Actual behavior**: What actually happens
7. **Error messages**: Full error output
8. **Configuration**: Your values.yaml (sanitized)

## 💡 Feature Requests

When requesting features, please include:

1. **Use case**: Why is this feature needed?
2. **Proposed solution**: How should it work?
3. **Alternatives**: Other solutions you've considered
4. **Additional context**: Any other relevant information

## 🔒 Security

### Reporting Security Issues

Please do **NOT** report security vulnerabilities through public GitHub issues.

Instead, please email security issues to: `security@yourdomain.com`

Include:
- Description of the vulnerability
- Steps to reproduce
- Potential impact
- Suggested fix (if any)

## 📋 Release Process

### Version Bumping

We follow [Semantic Versioning](https://semver.org/):

- **MAJOR**: Breaking changes
- **MINOR**: New features (backward compatible)
- **PATCH**: Bug fixes (backward compatible)

### Release Checklist

- [ ] Update `Chart.yaml` version
- [ ] Update `CHANGELOG.md`
- [ ] Test with multiple configurations
- [ ] Update documentation if needed
- [ ] Create release tag
- [ ] Publish to chart repository (if applicable)

## 🤝 Community

### Getting Help

- **GitHub Issues**: For bugs and feature requests
- **GitHub Discussions**: For questions and general discussion
- **Documentation**: Check the README and examples first

### Code of Conduct

This project follows the [Contributor Covenant Code of Conduct](CODE_OF_CONDUCT.md). By participating, you agree to uphold this code.

## 📄 License

By contributing to this project, you agree that your contributions will be licensed under the MIT License.

---

Thank you for contributing! 🎉
