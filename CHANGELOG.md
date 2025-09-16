# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

### Added
- Support for multiple configuration profiles (generic and Smartway-specific)
- Comprehensive documentation and examples
- MIT License

## [0.1.2] - 2024-01-XX

### Added
- Smartway-specific configuration support
- Multiple values files (values.yaml, values-smartway.yaml, values-generic.yaml)
- Production and development example configurations
- Comprehensive README with badges and detailed documentation
- Global labels centralization
- Datadog tags integration

### Changed
- Default values.yaml is now generic (non-Smartway specific)
- Improved template structure and organization
- Enhanced backward compatibility

### Fixed
- Template compatibility issues with missing values
- ServiceAccount helper function improvements
- Ingress and HPA template robustness

## [0.1.1] - 2024-01-XX

### Added
- Vault integration for secret management
- Datadog monitoring tags
- ConfigMap with configurable environment variables
- Traefik IngressRoute support
- Health checks (readiness and liveness probes)
- Custom variables support in ConfigMap

### Changed
- Deployment template restructured for better organization
- Service template updated for consistency

## [0.1.0] - 2024-01-XX

### Added
- Initial release
- Basic Metabase deployment
- Service configuration
- Basic ingress support
- Standard Kubernetes resources (Deployment, Service, ServiceAccount)

[Unreleased]: https://github.com/your-org/metabase-helm-chart/compare/v0.1.2...HEAD
[0.1.2]: https://github.com/your-org/metabase-helm-chart/compare/v0.1.1...v0.1.2
[0.1.1]: https://github.com/your-org/metabase-helm-chart/compare/v0.1.0...v0.1.1
[0.1.0]: https://github.com/your-org/metabase-helm-chart/releases/tag/v0.1.0
