# Besu Chart

## Configuration

| field | description | default |
|- |- |- |
| imagePullSecrets.enabled | true if imagePullSecrets will be provided | false |
| imagePullSecrets.value | a list of names of imagePullSecrets | [] |
| `besu.extraVolumes` | a list of additional volumes to add to the besu StatefulSets | `[]` |
| `besu.extraVolumeMounts` | a list of additional volume mounts to the besu StatefulSet containers | `[]` |
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
| besu.genesis.alloc | a custom genesis account allocation block (in yaml, it will be transformed into JSON) | `nil` |
| besu.genesis.ibftBlockPeriodSeconds | the ibft block period in seconds | `2` |
| besu.genesis.ibftEpochLength | the ibft epoch length in blocks | `30000` |
| besu.genesis.ibftRequestTimeoutSeconds | ibft request timeout  | `10` |
| besu.genesisFilePath | the path to the genesis file | `"/etc/genesis/genesis.json"` |
| besu.logging | the logging level | `"info"` |
| `besu.affinity` | custom affinity rules for the besu statefulset | nil |
| `besu.image.repository` | the repository of the besu image | `"blockchaintp/besu"` |
| besu.image.tag | the tag of the besu image | `"BTP2.1.0"` |
| besu.image.imagePullPolicy | the pull policy for the besu image | `"IfNotPresent"` |
| besu.p2p.enabled | true if the p2p listener will be enabled | true |
| besu.p2p.discover | true if the p2p discovery will be enabled | true |
| besu.p2p.host | the address to bind the p2p listener to | `"0.0.0.0"` |
| besu.p2p.port | the port to bind the p2p listener to | `30303` |
| besu.p2p.maxPeers | the max number of peers to connect to | `25` |
| besu.http.whitelist | the list of whitelisted http endpoints | `[*]` |
| besu.txPool.retentionHours | the number of hours to keep transactions in the tx pool | `999` |
| besu.txPool.maxSize | the max number of transactions to keep in the tx pool | `1024` |
| orion.create | if true, an orion instance will be created, and used if `besu.privacy.enabled==true` | false |
| `extraVolumes` | a list of additional volumes to add to all StatefulSets, Deployments, and DaemonSets | `[]` |
| `extraVolumeMounts` | a list of additional volume mounts to add to all StatefulSet, Deployment, and DaemonSet containers | `[]` |
