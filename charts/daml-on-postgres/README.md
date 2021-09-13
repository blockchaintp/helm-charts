# Daml on Postgres Chart

## Configuration

| field | description | default |
|- |- |- |
| imagePullSecrets.enabled | true if imagePullSecrets will be provided | false |
| imagePullSecrets.value | a list of names of imagePullSecrets | [] |
| daml.auth.enabled | true if authentication is to be enabled | false |
| daml.image.repository | the docker image repository | blockchaintp/daml-on-postgres |
| daml.image.tag | the docker image tag | latest |
| daml.image.pullPolicy | the docker image pull policy | IfNotPresent |
| daml.ledgerId | the daml ledger id | someIdentifyingString |
| daml.extra_args.enabled | true if extra_args will be provided | false |
| daml.extra_args.arg_str | a string of extra arguments | "" |
| daml.rpc.port | the daml grpc listener port | 39000 |
| daml.rpc.resources | the daml rpc resources constraints | {} |
| daml.rpc.env  | the daml rpc environment variable definitions | {} |
| daml.serviceAccount.create | true if the service account will be created | true |
| daml.serviceAccount.name | to override the name of the service account use this | nil |
| daml.jsonapi.image.repository | the docker image repository | blockchaintp/daml-on-postgres-jsonapi |
| daml.jsonapi.image.tag | the docker image tag | latest |
| daml.jsonapi.image.pullPolicy | the docker image pull policy | IfNotPresent |
| daml.jsonapi.ports.http | the port the json api will listen on | 8080 |
| daml.jsonapi.packageReloadInterval | the interval in seconds between package reloads | 5s |
| daml.jsonapi.resources | the json api resources constraints | {} |
| daml.jsonapi.waitTimeSeconds | how many seconds to way for the ledger api to start. 0 for forever | 0 |
| daml.jsonapi.env  | the json api environment variable definitions | {} |
| daml.jsonapi.ingress.apiVersion | if necessary the apiVersion of the ingress may be overridden | "" |
| daml.jsonapi.ingress.enabled | true to enable the ingress to the main service rest-api | false |
| daml.jsonapi.ingress.certManager | true to enable the acme certmanager for this ingress | false |
| daml.jsonapi.ingress.hostname | primary hostname for the ingress | false |
| daml.jsonapi.ingress.path | path for the ingress's primary hostname | / |
| daml.jsonapi.ingress.pathType | pathType for the ingress's primary hostname | nil |
| daml.jsonapi.ingress.annotations | annotations for the ingress | {} |
| daml.jsonapi.ingress.tls | true to enable tls on the ingress with a secrete at hostname-tls | false |
| daml.jsonapi.ingress.extraHosts | list of extra hosts to add to the ingress | [] |
| daml.jsonapi.ingress.extraPaths | list of extra paths to add to the primary host of the ingress | [] |
| daml.jsonapi.ingress.extraTls | list of extra tls entries | [] |
| daml.jsonapi.ingress.hosts | list of ingress host and path declarations for the jsonapi ingress | list | [] |
| postgres.enabled | true if the embedded postgres will be enabled | true |
| postgres.image.repository | the docker image repository | postgres |
| postgres.image.tag | the docker image tag | latest |
| postgres.image.pullPolicy | the docker image pull policy | IfNotPresent |
| postgres.host | the postgres host | localhost |
| postgres.port | the postgres port | 5432 |
| postgres.user | the postgres user | postgres |
| postgres.database | the postgres database | postgres |
| postgres.password | the postgres password | '' |
| postgres.existingPasswordSecret | the name of an existing password secret | '' |
| postgres.persistence.enabled | true if the postgres persistence will be enabled | true |
| postgres.persistence.storageClass | the name of the storage class | nil (default) |
| postgres.persistence.accessModes | the access modes for the postgres persistence | ["ReadWriteOnce"] |
| postgres.persistence.size | the size of the postgres persistence | 10Gi |
| openssl.image.repository | the docker image repository | openssl |
| openssl.image.tag | the docker image tag | latest |
| k8s.image.repository | the docker image repository | kubernetes |
| k8s.image.tag | the docker image tag | latest |
| extraVolumes | a list of additional volumes to add to all StatefulSets, Deployments, and DaemonSets | [] |
| extraVolumeMounts | a list of additional volume mounts to add to all StatefulSet, Deployment, and DaemonSet containers | [] |
