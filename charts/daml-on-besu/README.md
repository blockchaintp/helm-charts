# DAML on Besu Chart

## Configuration

| field | description | type | default |
|- |- |- |- |
|`besu` | besu settings | map | N/A |
| `besu.seedNetwork` | whether or not this is a seed or genesis network | boolean | true |
| `besu.seedGenesis` | the genesis configuration used if this is not a seed network | string | nil |
| `besu.additionalBootnodeUrls` | A list of enode defining objects defined as below | list | `[]` |
| `besu.additionalBootnodeUrls[].pubkey` | the public key of the enode url | string | |
| `besu.additionalBootnodeUrls[].host` | the hostname of the enode url (it will be resolved if not an ip) | string | |
| `besu.additionalBootnodeUrls[].port` | the port for the enode url | number | |
| `besu.annotations` | annotations for the besu statefulset | map | null |
| `besu.nodeCount` | the number of besu nodes to start an initial genesis requires 4 | number | 4 |
| `besu.affinity` | custom affinity rules for the besu statefulset | map | nil |
| `daml` | settings for DAML subsystem | map | N/A |
| `daml.ledgerId` | ledger id for this participant | string | default-ledger-id |
| `daml.annotations` | annotations for the daml rpc statefulset | map | null |
| `daml.rpcCount` | number identical rpc participants to allocate | number | 1 |
| `daml.rpc` | settings for daml-rpc | map | N/A |
| `daml.rpc.env` | list of environment name/value dicts | map | nil |
| `daml.rpc.extra_args` | extra arguments settings for daml-rpc | map | N/A |
| `daml.rpc.extra_args.enabled` | if true add the extra arguments | boolean | false |
| `daml.rpc.extra_args.arg_str` | string of extra arguments to add | string | nil |
| `daml.rpc.participantId` | DAML participant id for this participant | string | daml-participant |
| `daml.rpc.port` | DAML grpc listening port | int | 39000 |
| `daml.rpc.postgres_url` | The URL of the index database as described here https://jdbc.postgresql.org/documentation/80/connect.html | string | jdbc:postgresql://localhost/postgres?user=postgres |
| `daml.jsonapi.enabled` | Enabled the DAML JSON API | boolean | false |
| `daml.jsonapi.image.repository` | repository for the jsonapi image | string | blockchaintp/daml-json-api |
| `daml.jsonapi.image.tag` | tag for the jsonapi image | string | BTP2.1.0rc14 |
| `daml.jsonapi.image.pullPolicy` | imagePullPolicy for container | string | IfNotPresent |
| `daml.jsonapi.args` | extra args | string | nil |
| `daml.jsonapi.env` | list of environment name/value dicts | map | nil |
| `daml.jsonapi.packageReloadInterval` | how often to periodically check the daml-rpc for new daml packages | string | 5s |
| `daml.jsonapi.waitTimeSeconds` | how long to wait for the daml-rpc server to come available | int | 0 (forever) |
