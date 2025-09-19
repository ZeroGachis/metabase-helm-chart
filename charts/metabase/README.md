# metabase

![Version: 0.2.0](https://img.shields.io/badge/Version-0.2.0-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square)

A Helm chart to deploy a Metabase instance for Kubernetes in a context with Hashicorp Vault as secret manager and Traefik as ingress controller.

**Homepage:** <https://github.com/ZeroGachis/metabase-helm-chart/>

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| Smartway | <devops@smartway.ai> |  |

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| global.labels | object | `{}` | Global labels applied to all resources |
| global.service_name | string | `"metabase"` | Service name used for resource naming |
| metabase.configMapVars | list | `[{"name":"MB_DB_TYPE","value":"h2"},{"name":"MB_DB_PORT","value":"5432"},{"name":"JAVA_OPTS","value":"-Xmx2g -Dc3p0.maxIdleTime=900 -Dc3p0.maxIdleTimeExcessConnections=1500"},{"name":"MB_REDIRECT_ALL_REQUESTS_TO_HTTPS","value":"false"}]` | ConfigMap variables configuration |
| metabase.healthCheck | object | `{"liveness":{"failureThreshold":10,"initialDelaySeconds":90,"periodSeconds":15,"successThreshold":1,"timeoutSeconds":5},"readiness":{"failureThreshold":10,"initialDelaySeconds":120,"periodSeconds":15,"successThreshold":1,"timeoutSeconds":5}}` | Health check configuration |
| metabase.healthCheck.liveness | object | `{"failureThreshold":10,"initialDelaySeconds":90,"periodSeconds":15,"successThreshold":1,"timeoutSeconds":5}` | Liveness probe configuration |
| metabase.healthCheck.liveness.failureThreshold | int | `10` | Number of failed checks before restarting container |
| metabase.healthCheck.liveness.initialDelaySeconds | int | `90` | Initial delay before liveness probe starts (seconds) |
| metabase.healthCheck.liveness.periodSeconds | int | `15` | Period between liveness probe checks (seconds) |
| metabase.healthCheck.liveness.successThreshold | int | `1` | Number of successful checks needed for liveness |
| metabase.healthCheck.liveness.timeoutSeconds | int | `5` | Timeout for liveness probe (seconds) |
| metabase.healthCheck.readiness | object | `{"failureThreshold":10,"initialDelaySeconds":120,"periodSeconds":15,"successThreshold":1,"timeoutSeconds":5}` | Readiness probe configuration |
| metabase.healthCheck.readiness.failureThreshold | int | `10` | Number of failed checks before marking as not ready |
| metabase.healthCheck.readiness.initialDelaySeconds | int | `120` | Initial delay before readiness probe starts (seconds) |
| metabase.healthCheck.readiness.periodSeconds | int | `15` | Period between readiness probe checks (seconds) |
| metabase.healthCheck.readiness.successThreshold | int | `1` | Number of successful checks needed for readiness |
| metabase.healthCheck.readiness.timeoutSeconds | int | `5` | Timeout for readiness probe (seconds) |
| metabase.image | object | `{"repository":"metabase/metabase","tag":"latest"}` | Metabase image configuration |
| metabase.image.repository | string | `"metabase/metabase"` | Metabase image repository |
| metabase.image.tag | string | `"latest"` | Metabase image tag |
| metabase.ingress | object | `{"entryPoints":["internal"],"tls":{"enabled":false,"secretName":""},"url":"metabase.example.com"}` | IngressRoute configuration |
| metabase.ingress.entryPoints | list | `["internal"]` | Entry points for Traefik |
| metabase.ingress.tls | object | `{"enabled":false,"secretName":""}` | TLS configuration |
| metabase.ingress.url | string | `"metabase.example.com"` | IngressRoute URL/hostname |
| metabase.nodeSelector | object | `{}` | Node selector for pod placement |
| metabase.ports | object | `{"http":3000}` | Port configuration |
| metabase.ports.http | int | `3000` | HTTP port for Metabase container |
| metabase.replicas | int | `1` | Number of replicas |
| metabase.resources | object | `{"limits":{"cpu":"1000m","memory":"2048Mi"},"requests":{"cpu":"500m","memory":"1024Mi"}}` | Resource requests and limits |
| metabase.resources.limits | object | `{"cpu":"1000m","memory":"2048Mi"}` | Resource limits |
| metabase.resources.limits.cpu | string | `"1000m"` | CPU limit |
| metabase.resources.limits.memory | string | `"2048Mi"` | Memory limit |
| metabase.resources.requests | object | `{"cpu":"500m","memory":"1024Mi"}` | Resource requests |
| metabase.resources.requests.cpu | string | `"500m"` | CPU request |
| metabase.resources.requests.memory | string | `"1024Mi"` | Memory request |
| metabase.secretsVars | list | `[{"envVars":[{"key":"DB_NAME","name":"MB_DB_DBNAME"},{"key":"DB_USER","name":"MB_DB_USER"},{"key":"DB_PASS","name":"MB_DB_PASS"}],"name":"metabase-db-credentials-secret","vaultPath":"metabase/db-credentials"},{"envVars":[{"key":"DB_HOST","name":"MB_DB_HOST"}],"name":"metabase-db-host-secret","vaultPath":"metabase/db-host"}]` | Secrets variables configuration |
| metabase.tolerations | list | `[]` | Pod tolerations |
| service.port | int | `3000` | Service port (port exposed by the service) |
| service.targetPort | string | `nil` | Target port (port on the container, defaults to metabase.ports.http) |
| service.type | string | `"ClusterIP"` | Service type (ClusterIP, NodePort, LoadBalancer) |
| serviceAccount.create | bool | `true` | Create a service account |
| serviceAccount.name | string | `"metabase-sa"` | Service account name |
| vault.authMount | string | `"kubernetes"` | Vault authentication mount path |
| vault.connection | object | `{"address":"http://vault.vault.svc.cluster.local:8200","create":true,"name":"default"}` | Vault connection configuration |
| vault.connection.address | string | `"http://vault.vault.svc.cluster.local:8200"` | Vault server address |
| vault.connection.create | bool | `true` | Create VaultConnection resource |
| vault.connection.name | string | `"default"` | VaultConnection resource name |

----------------------------------------------
Autogenerated from chart metadata using [helm-docs v1.14.2](https://github.com/norwoodj/helm-docs/releases/v1.14.2)
