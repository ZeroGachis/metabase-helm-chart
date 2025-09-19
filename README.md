# Metabase Helm Chart

[![License](https://img.shields.io/badge/License-MIT-blue.svg)](LICENSE)
[![Helm Chart](https://img.shields.io/badge/Helm-Chart-blue.svg)](https://helm.sh/)
[![Kubernetes](https://img.shields.io/badge/Kubernetes-1.19%2B-blue.svg)](https://kubernetes.io/)

A production-ready Helm chart for deploying [Metabase](https://www.metabase.com/) on Kubernetes with support for both generic and organization-specific configurations.

## 🚀 Quick Start

### Prerequisites

- Kubernetes 1.19+
- Helm 3.0+
- Traefik 2.0+ (for IngressRoute)
- Vault Secrets Operator (for secret management)

### Helm Repository

This chart is available in the Smartway Helm repository:

```bash
# Add the repository
helm repo add metabase-helm http://metabase-helm.smartway.tools/
helm repo update

# List available charts
helm search repo metabase-helm
```

### Installation

```bash
# Add the Helm repository
helm repo add metabase-helm http://metabase-helm.smartway.tools/
helm repo update

# Install with default values
helm install metabase metabase-helm

# Or install with custom values
helm install metabase metabase-helm -f custom-values.yaml

# Alternative: Install from local chart
helm install metabase ./charts/metabase
```


### 🛠️ Customization

For a complete list of all available configuration options with detailed descriptions, see the [values.yaml](charts/metabase/values.yaml) file and [README.md associated](charts/metabase/README.md) . 


## Development

### Contributing to the Project

This project uses [mise](https://mise.jdx.dev/) for development tooling and task management. When developing new features or making changes to the Helm chart, you can use the following mise tasks:

#### Documentation Generation

Generate or update the chart documentation:

```bash
# Generate Helm chart documentation
mise run helm:docs

# Template the chart to validate changes
mise run helm:template
```

#### Chart Testing and Validation

Validate your changes using chart-testing:

```bash
# Lint the chart (without version bump check)
mise run ct:lint

# Lint with specific target branch
mise run ct:lint_with_target main

# Test chart installation
mise run ct:install

# Test installation with specific target branch
mise run ct:install_with_target main

# List changed charts
mise run ct:list_changed
```

#### Local Development Environment

Set up a local Kubernetes cluster for testing:

```bash
# Create a kind cluster with Vault and Traefik
mise run kind:create

# Setup Vault and Traefik on existing cluster
mise run kind:setup

# Clean up when done
mise run kind:delete
```

#### Development Workflow

1. **Make your changes** to the chart templates or values
2. **Generate documentation** with `mise run helm:docs`
3. **Validate templates** with `mise run helm:template`
4. **Lint the chart** with `mise run ct:lint`
5. **Test installation** with `mise run ct:install`
6. **Commit your changes** with proper conventional commit messages

For a complete list of available mise tasks, see the [.config/mise/config.toml](.config/mise/config.toml) file.




## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 🆘 Support

- **Issues**: [GitHub Issues](https://github.com/ZeroGachis/metabase-helm-chart/issues)
- **Discussions**: [GitHub Discussions](https://github.com/ZeroGacis/metabase-helm-chart/discussions)

