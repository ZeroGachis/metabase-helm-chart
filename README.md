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

### Generic Installation

```bash
# Add the Smartway Helm repository
helm repo add metabase-helm http://metabase-helm.smartway.tools/
helm repo update

# Install with default values
helm install metabase metabase-helm

# Or install with custom values
helm install metabase metabase-helm -f custom-values.yaml

# Alternative: Install from local chart
helm install metabase ./charts/metabase
```


## 🛠️ Customization

### Environment Variables

Add custom Metabase environment variables via the `config.customVars` section:

```yaml
metabase:
  config:
    customVars:
      MB_ENCRYPTION_SECRET_KEY: "your-encryption-key"
      MB_EMAIL_SMTP_HOST: "smtp.example.com"
      MB_EMAIL_SMTP_PORT: "587"
      MB_EMAIL_SMTP_USERNAME: "metabase@example.com"
      MB_EMAIL_SMTP_PASSWORD: "your-password"
      MB_EMAIL_SMTP_SECURITY: "tls"
```

### Resources

Adjust CPU and memory limits based on your needs:

```yaml
metabase:
  resources:
    requests:
      cpu: 1000m
      memory: 2048Mi
    limits:
      cpu: 2000m
      memory: 4096Mi
```

### Persistence

Enable persistent storage for Metabase data:

```yaml
metabase:
  persistence:
    enabled: true
    storageClass: "fast-ssd"
    accessMode: ReadWriteOnce
    size: 50Gi
```

### Global Labels

Customize labels applied to all resources:

```yaml
global:
  service_name: metabase
  env_name: production
  version: v1.0.0
  cluster_name: production
  labels:
    app.kubernetes.io/name: metabase
    app.kubernetes.io/instance: metabase
    environment: production
    team: analytics
    tags.datadoghq.com/env: "production"
    tags.datadoghq.com/service: "metabase"
    tags.datadoghq.com/version: "v1.0.0"
```

### Node Selection

Configure node selectors and tolerations:

```yaml
metabase:
  nodeSelector:
    node-type: "compute-optimized"
  tolerations:
    - key: "dedicated"
      operator: "Equal"
      value: "metabase"
      effect: "NoSchedule"
```

## 📁 Examples

The `examples/` directory contains various configuration examples:

- **`production.yaml`**: Production-ready configuration
- **`development.yaml`**: Minimal development setup

### Production Example

```bash
# From repository
helm install metabase metabase-helm -f examples/production.yaml

# From local chart
helm install metabase ./charts/metabase -f examples/production.yaml
```

### Development Example

```bash
# From repository
helm install metabase metabase-helm -f examples/development.yaml

# From local chart
helm install metabase ./charts/metabase -f examples/development.yaml
```

## 🔧 Advanced Configuration

### Vault Integration

The chart automatically creates Vault resources for secret management:

- **VaultAuth**: Kubernetes authentication method
- **VaultStaticSecret**: Automatic secret synchronization
- **ServiceAccount**: Dedicated service account for Vault

### Database Configuration

Configure database connection via Vault secrets:

```yaml
# Secrets are automatically managed via Vault
# Path: metabase/server (for app secrets)
# Path: rds-apps/direct-connection (for DB connection)
```

### Ingress Configuration

The chart supports Traefik IngressRoute:

```yaml
metabase:
  ingress:
    url: metabase.yourdomain.com
```

## 🧪 Testing

### Template Validation

```bash
# Validate templates from repository
helm template metabase metabase-helm --debug

# Validate with specific values from repository
helm template metabase metabase-helm -f values-smartway.yaml --debug

# Validate local templates
helm template metabase ./charts/metabase --debug
```


## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 🆘 Support

- **Issues**: [GitHub Issues](https://github.com/ZeroGachis/metabase-helm-chart/issues)
- **Discussions**: [GitHub Discussions](https://github.com/ZeroGacis/metabase-helm-chart/discussions)

## 📚 Additional Resources

- **Helm Repository**: [http://metabase-helm.smartway.tools/](http://metabase-helm.smartway.tools/)
- [Metabase Documentation](https://www.metabase.com/docs/)
- [Helm Documentation](https://helm.sh/docs/)
- [Kubernetes Documentation](https://kubernetes.io/docs/)
- [Traefik Documentation](https://doc.traefik.io/traefik/)
- [Vault Documentation](https://www.vaultproject.io/docs)
