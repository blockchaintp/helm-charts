# Sextant

This chart is the base chart to install BTP Sextant. By default it
installs the development version of Sextant. It's intended use is as
a dependency of other charts which install particular editions of the
software.

## Configuration

| field | description | type | default |
|-|-|-|-|
| `deployment` | Sextant support variable, don't change manually | map | N/A |
| `imagePullSecrets` | imagePullSecrets configuration | map | N/A |
| `imagePullSecrets.enabled` | true if imagePullSecrets are required | boolean | false |
| `imagePullSecrets.value` | a list if named secret references of the form   ```- name: secretName```| list | [] |
| `replicaCount` | number of Sextant replicas to run | int | 1 |
| `logging` | default logging level | string | "1" |
| `ui` | UI configuration settings | map | N/A |
| `ui.image` | UI image settings | map | N/A |
| `ui.image.repository` | UI image repository | string | "dev.catenasys.com:8083/blockchaintp/sextant" |
| `ui.image.tag` | UI image tag | string | "latest" |
| `ui.image.pullPolicy` | UI image pull policy | string | "IfNotPresent" |
| `api` | UI configuration settings | map | N/A |
| `api.image` | API image settings | map | N/A |
| `api.image.repository` | API image repository | string | "dev.catenasys.com:8083/blockchaintp/sextant-api" |
| `api.image.tag` | API image tag | string | "latest" |
| `api.image.pullPolicy` | API image pull policy | string | "IfNotPresent" |
| `noxy` | UI configuration settings | map | N/A |
| `noxy.image` | noxy image settings | map | N/A |
| `noxy.image.repository` | NOXY image repository | string | "dev.catenasys.com:8083/blockchaintp/noxy" |
| `noxy.image.tag` | noxy image tag | string | "latest" |
| `noxy.image.pullPolicy` | API image pull policy | string | "IfNotPresent" |
| `serviceAccount` | service account settings | map | N/A |
| `serviceAccount.create` | if true create the service account | boolean | true |
| `serviceAccount.name` | name of the service account for sextant | string | nil |
| `postgres` | postgres settings | map | N/A |
| `postgres.enabled` | if true create an internal postgres instance | boolean | true |
| `postgres.image` | postgres image settings | map | N/A |
| `postgres.image.repository` | postgres image repository | string | "postgres" |
| `postgres.image.tag` | postgres image tag | string | "11" |
| `postgres.user` | user for the postgres database | string | "postgres" |
| `postgres.host` | host for the postgres database | string | "localhost" |
| `postgres.database` | database for the postgres database | string | "postgres" |
| `postgres.port` | port for the postgres database | int | 5432 |
| `postgres.password` | password for the postgres database | string | "postgres" |
| `postgres.existingPasswordSecret` | name of a secret containing the postgres password | string | nil |
| `postgres.existingPasswordSecret` | name of the key in a secret containing the postgres password | string | password |
| `postgres.tls` | postgres TLS configuration | string | nil |
| `postgres.persistence` | postgres persistence settings | map | N/A |
| `postgres.persistence.enabled` | if true allocate a PVC for the postgres instance | boolean | false |
| `postgres.persistence.annotations` | any custom annotations to the postgres PVC's | map | {} |
| `postgres.persistence.accessModes` | postgres PVC access modes | list | [ "ReadWriteOnce" ] |
| `postgres.persistence.storageCloss` | postgres PVC storageClass | string | "gp2" |
| `postgres.persistence.size` | postgres PVC volume size | string | "40Gi" |
| `service` | service settings | map | N/A |
| `service.type` | Sextant service type | string | ClusterIP |
| `service.port` | Sextant service port | int | 8000 |
| `ingress` | ingress settings | map | N/A |
| `ingress.enabled` | true to enable an ingress for sextant | boolean | false |
| `ingress.annotations` | any custom annotations to the Sextant ingress | map | {} |
| `ingress.hosts` | a list of host and path lists to publish in the ingress | map | {} |
| `ingress.tls` | Sextant ingress TLS cofiguration | list | [] |
