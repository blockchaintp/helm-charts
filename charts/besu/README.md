# Besu Chart

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
| `besu.affinity` | custom affinity rules for the besu statefulset | map | nil |
