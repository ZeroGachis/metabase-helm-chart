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

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 🆘 Support

- **Issues**: [GitHub Issues](https://github.com/ZeroGachis/metabase-helm-chart/issues)
- **Discussions**: [GitHub Discussions](https://github.com/ZeroGacis/metabase-helm-chart/discussions)

