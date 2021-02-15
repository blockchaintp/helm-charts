# DAML on Besu Chart

## Configuration

| field | description | type | default |
|- |- |- |- |
| `daml` | settings for DAML subsystem | map | N/A |
| `daml.rpc` | settings for daml-rpc | map | N/A |
| `daml.rpc.extra_args` | extra arguments settings for daml-rpc | map | N/A |
| `daml.rpc.extra_args.enabled` | if true add the extra arguments | boolean | false |
| `daml.rpc.extra_args.arg_str` | string of extra arguments to add | string | nil |
| `daml.rpc.port` | DAML grpc listening port | int | 39000 |
| `daml.rpc.participantId` | DAML participant id for this participant | string | daml-participant |
