# Helm Chart

Daml on Besu helm chart.

## Configuration

| field | description | default |
|- |- |- |
| imagePullSecrets.enabled | true if imagePullSecrets will be provided | false |
| imagePullSecrets.value | a list of names of imagePullSecrets | [] |
| `besu.extraVolumeMounts` | extra volume mounts for the besu containers | [] |
| `besu.extraVolumes` | extra volume definitions for the besu set | [] |
| `besu.seedNetwork` | whether or not this is a seed or genesis network | true |
| `besu.seedGenesis` | the genesis configuration used if this is not a seed network | nil |
| `besu.additionalBootnodeUrls` | A list of enode defining objects defined as below | `[]` |
| `besu.additionalBootnodeUrls[].pubkey` | the public key of the enode url | |
| `besu.additionalBootnodeUrls[].host` | the hostname of the enode url (it will be resolved if not an ip) | |
| `besu.additionalBootnodeUrls[].port` | the port for the enode url | |
| besu.persistence.enabled | true if the besu persistence will be enabled | true |
| besu.persistence.annotations | annotations to be added to the persistence volume | `{}` |
| besu.persistence.accessMode | the access mode for the persistence volume | `ReadWriteOnce` |
| besu.persistence.storageClass | the storage class for the persistence volume | `gps` |
| besu.persistence.size | the size of the persistence volume | `40Gi` |
| besu.resources | the resources to be applied to the besu container | `{}` |
| besu.serviceAccount.create | true if the service account will be created | true |
| besu.serviceAccount.name | override the name of the service account | nil |
| `besu.nodeCount` | the number of besu nodes to start an initial genesis requires 4 | 4 |
| besu.chainId | the chain id for the besu nodes | "19750424" |
| besu.dataPath | the path to the data directory. This should not normally be changed | `/data` |
| besu.rpc.enabled | true if the besu json-rpc will be enabled | true |
| besu.rpc.host | the address to bind the json-rpc to | `"0.0.0.0"` |
| besu.rpc.api | the list of APIs to expose | `'["DEBUG","ETH", "ADMIN", "WEB3", "IBFT", "NET"]'` |
| besu.rpc.port | the port to bind the json-rpc | `8545` |
| besu.rpc.corsOrigins | the list of cors origins to allow | `'["all"]'` |
| besu.rpc.authenticationEnabled | true if the json-rpc will be authenticated | false |
| besu.ws.enabled | true if the besu ws listener will be enabled | false |
| besu.ws.api | the list of APIs to expose on the websocket listener | `'["DEBUG", "ETH", "WEB3", "NET"]'` |
| besu.ws.host | the address to bind the websocket listener to | `"0.0.0.0"` |
| besu.ws.port | the port to bind the websocket listener to | `8546` |
| besu.ws.corsOrigins | the list of cors origins to allow | `'["all"]'` |
| besu.ws.authenticationEnabled | true if the websocket will be authenticated | false |
| besu.graphql.enabled | true if the graphql listener will be enabled | false |
| besu.graphql.host | the address to bind the graphql listener to | `"0.0.0.0"` |
| besu.graphql.corsOrigins | the list of cors origins to allow | `'["all"]'` |
| besu.graphql.port | the port to bind the graphql listener to | `8547` |
| besu.discover.port | the port to bind the discovery listener to | `8549` |
| besu.metrics.enabled | true if the metrics listener will be enabled | false |
| besu.metrics.host | the address to bind the metrics listener to | `"0.0.0.0"` |
| besu.metrics.port | the port to bind the metrics listener to | `9545` |
| besu.metricsPush.enabled | true if the metrics push will be enabled | false |
| besu.metricsPush.host | the address to push metrics to | `"5.5.5.5"` |
| besu.metricsPush.port | the port to push metrics to | `9091` |
| besu.metricsPush.interval | the interval to push metrics to | `60` |
| besu.metricsPush.prometheusJob | the name of the prometheus metrics push job | "besu"
| besu.permissions.enabled | true if the permissions will be enabled | false |
| besu.permissions.nodes.enabled | true if the node permissions will be enabled | false |
| besu.permissions.nodes.whitelist | a list of whitelisted enodes | `[]` |
| besu.permissions.nodesContract.enabled | true if the node contract permissioning contract will be enabled | false |
| besu.permissions.nodesContract.address | address of the nodes permissioning contract | `"0x0000000000000000000000000000000000001234"` |
| besu.permissions.accounts.enabled | true if the account permissions will be enabled | false |
| besu.permissions.accounts.whitelist | a list of whitelisted accounts | `[]` |
| besu.privacy.enabled | true if the private transactions are enabled on this node | false |
| besu.privacy.url | the url to the private transaction manager | nil |
| besu.privacy.precompileAddress | the precompiled address of the privacy contract | `9` |
| besu.privacy.enclaveKeyConfigMap | the name of a configmap containing the enclave public Key | nil |
| besu.genesis.ibftBlockPeriodSeconds | the ibft block period in seconds | `2` |
| besu.genesis.ibftEpochLength | the ibft epoch length in blocks | `30000` |
| besu.genesis.ibftRequestTimeoutSeconds | ibft request timeout  | `10` |
| besu.genesisFilePath | the path to the genesis file | `"/etc/genesis/genesis.json"` |
| besu.logging | the logging level | `"info"` |
| `besu.affinity` | custom affinity rules for the besu statefulset | nil |
| `besu.image.repository` | the repository of the besu image | `"dev.catenasys.com:8084/blockchaintp/besu"` |
| besu.image.tag | the tag of the besu image | `"BTP2.1.0rc15"` |
| besu.image.imagePullPolicy | the pull policy for the besu image | `"IfNotPresent"` |
| `besu.privateImage.repository` | the repository of the besu image | `"dev.catenasys.com:8084/blockchaintp/besu-private"` |
| besu.privateImage.imagePullPolicy | the pull policy for the besu image | `"IfNotPresent"` |
| besu.privateImage.imagePullPolicy | the pull policy for the besu image | `"IfNotPresent"` |
| besu.p2p.enabled | true if the p2p listener will be enabled | true |
| besu.p2p.discover | true if the p2p discovery will be enabled | true |
| besu.p2p.host | the address to bind the p2p listener to | `"0.0.0.0"` |
| besu.p2p.port | the port to bind the p2p listener to | `30303` |
| besu.p2p.maxPeers | the max number of peers to connect to | `25` |
| besu.http.whitelist | the list of whitelisted http endpoints | `[*]` |
| besu.txPool.retentionHours | the number of hours to keep transactions in the tx pool | `999` |
| besu.txPool.maxSize | the max number of transactions to keep in the tx pool | `1024` |
| daml.affinity | custom affinity rules for the daml statefulset | nil |
| daml.auth.enabled | true if authentication is to be enabled | false |
| daml.image.repository | the repository of the daml rpc image | `"dev.catenasys.com:8084/blockchaintp/rpc"` |
| daml.image.tag | the tag of the daml rpc image | `"BTP2.1.0rc15"` |
| daml.image.imagePullPolicy | the pull policy for the daml rpc image | `"IfNotPresent"` |
| `daml.ledgerId` | ledger id for this participant | default-ledger-id |
| `daml.annotations` | annotations for the daml rpc statefulset | {} |
| `daml.rpcCount` | number identical rpc participants to allocate | 1 |
| `daml.repeater.repository` | url of the repeater repository | dev.catenasys.com:8084/blockchaintp/repeater |
| `daml.repeater.tag` | tag of the repeater image | BTP2.1.0rc15 |
| `daml.repeater.pullPolicy` | pullPolicy of the repeater image | BTP2.1.0rc15 |
| `daml.repeater.enabled` | the repeater repeats items from the central committer to the various participants | BTP2.1.0rc15 |
| `daml.repeater.participantId` | the pariticipantId of the central committer | nil |
| `daml.rpc.env` | list of environment name/value dicts | nil |
| `daml.rpc.extra_args` | extra arguments settings for daml-rpc | N/A |
| `daml.rpc.extra_args.enabled` | if true add the extra arguments | false |
| `daml.rpc.extra_args.arg_str` | string of extra arguments to add | nil |
| `daml.rpc.participantId` | DAML participant id for this participant | daml-participant |
| `daml.rpc.port` | DAML grpc listening port | 39000 |
| `daml.rpc.postgres_url` | The URL of the index database as described here https://jdbc.postgresql.org/documentation/80/connect.html | jdbc:postgresql://localhost/postgres?user=postgres |
| `daml.jsonapi.enabled` | Enabled the DAML JSON API | false |
| `daml.jsonapi.image.repository` | repository for the jsonapi image | blockchaintp/daml-json-api |
| `daml.jsonapi.image.tag` | tag for the jsonapi image | BTP2.1.0rc15 |
| `daml.jsonapi.image.pullPolicy` | imagePullPolicy for container | IfNotPresent |
| `daml.jsonapi.ingress.apiVersion` | if necessary the apiVersion of the ingress may be overridden | "" |
| `daml.jsonapi.ingress.enabled` | true to enable the ingress to the main service rest-api | false |
| `daml.jsonapi.ingress.certManager` | true to enable the acme certmanager for this ingress | false |
| `daml.jsonapi.ingress.hostname` | primary hostname for the ingress | false |
| `daml.jsonapi.ingress.path` | path for the ingress's primary hostname | / |
| `daml.jsonapi.ingress.pathType` | pathType for the ingress's primary hostname | nil |
| `daml.jsonapi.ingress.annotations` | annotations for the ingress | {} |
| `daml.jsonapi.ingress.tls` | true to enable tls on the ingress with a secrete at hostname-tls | false |
| `daml.jsonapi.ingress.extraHosts` | list of extra hosts to add to the ingress | [] |
| `daml.jsonapi.ingress.extraPaths` | list of extra paths to add to the primary host of the ingress | [] |
| `daml.jsonapi.ingress.extraTls` | list of extra tls entries | [] |
| `daml.jsonapi.args` | extra args | nil |
| `daml.jsonapi.env` | list of environment name/value dicts | nil |
| `daml.jsonapi.packageReloadInterval` | how often to periodically check the daml-rpc for new daml packages | 5s |
| `daml.jsonapi.waitTimeSeconds` | how long to wait for the daml-rpc server to come available | 0 (forever) |
| `daml.extraVolumeMounts` | extra volume mounts for the daml-on-besu container | [] |
| `daml.extraVolumes` | extra volume definitions for the daml-on-besu container | [] |
| `extraVolumeMounts` | extra volume mounts for all sets | [] |
| `extraVolumes` | extra volume definitions for all sets | [] |
| orion.create | if true, an orion instance will be created, and used if `besu.privacy.enabled==true` | false |
| postgres.enabled | true if the embedded postgres will be enabled | true |
| postgres.image.repository | the docker image repository | postgres |
| postgres.image.tag | the docker image tag | latest |
| postgres.image.pullPolicy | the docker image pull policy | IfNotPresent |
| postgres.persistence.enabled | true if the postgres persistence will be enabled | true |
| postgres.persistence.accessModes | the access modes for the postgres persistence | ["ReadWriteOnce"] |
| postgres.persistence.storageClass | the name of the storage class | "gp2" |
| postgres.persistence.size | the size of the postgres persistence | 10Gi |
| openssl.image.repository | the docker image repository | openssl |
| openssl.image.tag | the docker image tag | latest |
| k8s.image.repository | the docker image repository | kubernetes |
| k8s.image.tag | the docker image tag | latest |
