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
| `besu.nodeCount` | the number of besu nodes to start an initial genesis requires 4 | number | 4 |
| `daml` | settings for DAML subsystem | map | N/A |
| `daml.ledgerId` | ledger id for this participant | string | default-ledger-id |
| `daml.rpcCount` | number identical rpc participants to allocate | number | 1 |
| `daml.rpc` | settings for daml-rpc | map | N/A |
| `daml.rpc.extra_args` | extra arguments settings for daml-rpc | map | N/A |
| `daml.rpc.extra_args.enabled` | if true add the extra arguments | boolean | false |
| `daml.rpc.extra_args.arg_str` | string of extra arguments to add | string | nil |
| `daml.rpc.port` | DAML grpc listening port | int | 39000 |
| `daml.rpc.participantId` | DAML participant id for this participant | string | daml-participant |
