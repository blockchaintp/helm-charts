# DAML on QLDB Chart

## Configuration

| field | description | type | default |
|- |- |- |- |
| `imagePullSecrets.enabled`| if true use the list of named imagePullSecrets| false |
| `imagePullSecrets.value`| a list if named secret references of the form `- name: secretName`| [] |
| `affinity`| custom affinity rules for the daml-rpc pod | {} |
| `args` | a string of additional arguments for the daml-rpc | nil |
| `auth.enabled` | set to true to enable DAML authentication| false |
| `extraVolumes` | a list of additional volumes to add to the daml-rpc | `[]` |
| `extraVolumeMounts` | a list of additional volume mounts to add to the daml-rpc | `[]` |
| `port` | the port on which the daml-rpc GRPC service listens
| `image.pullPolicy` | the image pull policy for the daml-rpc image | IfNotPresent |
| `image.repository` | the repository for the daml-rpc image | blockchaintp/sawtooth-daml-rpc |
| `image.tag` | the tag for the daml-rpc image | BTP2.1.0 |
| `ingress.enabled` | enable the ingress for the daml-rpc| false |
| `ingress.hostname` | primary hostname for the ingress | false |
| `ingress.path` | path for the ingress's primary hostname | / |
| `ingress.pathType` | pathType for the ingress's primary hostname | nil |
| `ingress.annotations` | annotations for the ingress NOTE: since the daml-rpc uses GRPC these are normally needed | {} |
| `ingress.tls` | true to enable tls on the ingress with a secrete at hostname-tls | false |
| `ingress.extraHosts` | list of extra hosts to add to the ingress | [] |
| `ingress.extraPaths` | list of extra paths to add to the primary host of the ingress | [] |
| `ingress.extraTls` | list of extra tls entries | [] |
| `ingress.hosts`| list of ingress host and path declarations for the jsonapi ingress| [] |
| `maxOutstandingBatches` | max outstanding batches for the daml-rpc pod | 2 |
| `maxOpsPerBatch` | maximum number of operations per batch for the daml-rpc pod | 100 |
| `participantId`| use this participant id otherwise one choose based on network| nil |
| `startupDelay` | seconds to delay start up the daml-rpc | 90 |
| `serviceAccount.create` | true to create a service account | false |
| `serviceAccount.name` | name of the service account | nil (defaults to based on release name) |
| `jsonapi.authToken` | the auth token to use for the jsonapi server (required if auth.enabled) | nil |
| `jsonapi.image.repository` | the repository of the image| blockchaintp/daml-json-api |
| `jsonapi.image.tag`| the tag of the image to use| latest |
| `jsonapi.image.pullPolicy` | the image pull policy to use| IfNotPresent |
| `jsonapi.ingress.apiVersion` | if necessary the apiVersion of the ingress may be overridden | "" |
| `jsonapi.ingress.enabled` | true to enable the ingress to the main service rest-api | false |
| `jsonapi.ingress.certManager` | true to enable the acme certmanager for this ingress | false |
| `jsonapi.ingress.hostname` | primary hostname for the ingress | false |
| `jsonapi.ingress.path` | path for the ingress's primary hostname | / |
| `jsonapi.ingress.pathType` | pathType for the ingress's primary hostname | nil |
| `jsonapi.ingress.annotations` | annotations for the ingress | {} |
| `jsonapi.ingress.tls` | true to enable tls on the ingress with a secrete at hostname-tls | false |
| `jsonapi.ingress.extraHosts` | list of extra hosts to add to the ingress | [] |
| `jsonapi.ingress.extraPaths` | list of extra paths to add to the primary host of the ingress | [] |
| `jsonapi.ingress.extraTls` | list of extra tls entries | [] |
| `jsonapi.ingress.hosts`| list of ingress host and path declarations for the jsonapi ingress| [] |
| `k8s.image.repository`| the image name| alpine/k8s |
| `k8s.image.tag`| the image tag to use| 1.18.2 |
| `k8s.image.pullPolicy`| the image pull policy to use| IfNotPresent |
| `openssl.image.repository`| the image name| alpine/openssl |
| `openssl.image.tag`| the image tag to use| latest |
| `openssl.image.pullPolicy`| the image pull policy to use| IfNotPresent |
| postgresql.create | true if an embedded postgresql will be created. if false external database credentials will need to be provided | true |
| postgresql.postgresqlDatabase | name of the postgres database to use | "postgresqlidx" |
| postgresql.postgresqlUsername | name of the postgres user to use | "qldb" |
| postgresql.host | the hostname of the postgresql server | nil |
| postgresql.existingSecret | the name of an existing secret containing the postgresql credentials | nil |
| postgresql.postgresqlPassword | the password of the postgresql user | nil |
| postgresql.servicePort | the port of the postgresql server | 5432 |
| postgresql.replicationPassword | the password of the postgresql replication user | nil |
| postgresql.initdbScripts | a map of initdb scripts to run on the postgresql server |  |
| postgresql.create | true if an embedded postgresql will be created. if false external database credentials will need to be provided | true |
| postgresql.postgresqlDatabase | name of the postgres database to use | "orion" |
| postgresql.postgresqlUsername | name of the postgres user to use | "orion" |
| postgresql.host | the hostname of the postgresql server | nil |
| postgresql.existingSecret | the name of an existing secret containing the postgresql credentials | nil |
| postgresql.postgresqlPassword | the password of the postgresql user | nil |
| postgresql.servicePort | the port of the postgresql server | 5432 |
| postgresql.replicationPassword | the password of the postgresql replication user | nil |
| postgresql.initdbScripts | a map of initdb scripts to run on the postgresql server |  |
| `trigger.extraVolumeMounts` | extra volume mounts for trigger service | list | nil
| `trigger.extraVolumes` | extra volumes declarations for trigger service | list | nil
| `trigger.image.pullPolicy` | the image pull policy | IfNotPresent |
| `trigger.image.repository`| the image name| blockchaintp/sawtooth-daml-trigger |
| `trigger.image.tag`| the image tag to use| BTP2.1.0 |
| `trigger.triggerDefs`| settings for the individual trigger deployments which replaces the trigger-service See [Triggers](#triggers)| [] |

## Triggers

Triggers are described using maps of the following parameters

| field | description| required| default |
|- |-|-|- |
| `name` | kubernetes name of the trigger container| yes| (system-determined) |
| `triggerName` | daml name of the trigger to be run| yes| nil |
| `darFile` | path of the dar file to use| yes| nil |
| `party` | name of the party to use| yes| nil |
| `env` | environment var for the trigger| no| [] |
| `resources` | resources for the trigger| no| [] |
