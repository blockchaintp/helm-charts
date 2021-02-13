# daml-on-sawtooth

| field | description | type | default |
|-|-|-|-|
| `affinity` | group of affinity related parameters | map | N/A |
| `affinity.enabled` | false: no efffect  true: then validators will be deployed only to k8s nodes with the label `app={{.sawtooth.networkName}}-validator` | boolean | false |
| `imagePullSecrets` | group of image pull secrets related parameters | map | N/A |
| `imagePullSecrets.enabled` | if true use the list of named imagePullSecrests | boolean | false |
| `imagePullSecrets.value` | a list if named secret references of the form   ```- name: secretName```| list | [] |
| `sawtooth` | group of sawtooth related parameters | map | N/A |
| `sawtooth.opentsdb` | group of opentsdb parameters for sawtooth | map | N/A |
| `sawtooth.opentsdb.db` | name of the opentsdb database to be used | string | metrics |
| `sawtooth.opentsdb.url` | url of the opentsdb database to be used | string | nil |
| `sawtooth.opentsdb.enabled` | whether to enable the opentsdb metrics | boolean | false |
| `sawtooth.minReadySeconds` | the minimum time a pod must be Running before proceeeding on a rolling update | int | 120 |
| `sawtooth.maxUnavailable` | maximum number of pods allowed down on a rollout or update  | int | 1 |
| `sawtooth.containers` | settings group for all sawtooth containers | map | N/A |
| `sawtooth.containers.jsonapi.args` | extra args | string | nil |
| `sawtooth.containers.jsonapi.env` | list of environment name/valie dicts | map | nil |
| `sawtooth.containers.jsonapi.imagePullPolicy` | imagePullPolicy for container | string | IfNotPresent |
| `sawtooth.containers.jsonapi.packageReloadInterval` | how often to periodically check the daml-rpc for new daml packages | string | 5s |
| `sawtooth.containers.jsonapi.waitTimeSeconds` | how long to wait for the daml-rpc server to come available | int | 0 (forever) |
| `sawtooth.containers.block_info` | settings group for all sawtooth block-info-tp container | map | N/A |
| `sawtooth.containers.block_info.args` | extra args | string | nil |
| `sawtooth.containers.block_info.env` | list of environment name/valie dicts | map | nil |
| `sawtooth.containers.block_info.imagePullPolicy` | imagePullPolicy for container | string | IfNotPresent |
| `sawtooth.containers.daml_trigger.args` | extra args | string | nil |
| `sawtooth.containers.daml_trigger.env` | list of environment name/valie dicts | map | nil |
| `sawtooth.containers.daml_trigger.imagePullPolicy` | imagePullPolicy for container | string | IfNotPresent |
| `sawtooth.containers.daml_tp.args` | extra args | string | nil |
| `sawtooth.containers.daml_tp.env` | list of environment name/valie dicts | map | nil |
| `sawtooth.containers.daml_tp.imagePullPolicy` | imagePullPolicy for container | string | IfNotPresent |
| `sawtooth.containers.devmode_engine.args` | extra args | string | nil |
| `sawtooth.containers.devmode_engine.env` | list of environment name/valie dicts | map | nil |
| `sawtooth.containers.devmode_engine.imagePullPolicy` | imagePullPolicy for container | string | IfNotPresent |
| `sawtooth.containers.identity_tp` | settings group for all sawtooth identity-tp container | map | N/A |
| `sawtooth.containers.identity_tp.args` | extra args | string | nil |
| `sawtooth.containers.identity_tp.env` | list of environment name/valie dicts | map | nil |
| `sawtooth.containers.identity_tp.imagePullPolicy` | imagePullPolicy for container | string | IfNotPresent |
| `sawtooth.containers.intkey_tp.args` | extra args | string | nil |
| `sawtooth.containers.intkey_tp.env` | list of environment name/valie dicts | map | nil |
| `sawtooth.containers.intkey_tp.imagePullPolicy` | imagePullPolicy for container | string | IfNotPresent |
| `sawtooth.containers.monitor.args` | extra args | string | nil |
| `sawtooth.containers.monitor.env` | list of environment name/valie dicts | map | nil |
| `sawtooth.containers.monitor.imagePullPolicy` | imagePullPolicy for container | string | IfNotPresent |
| `sawtooth.containers.pbft_engine.args` | extra args | string | nil |
| `sawtooth.containers.pbft_engine.env` | list of environment name/valie dicts | map | nil |
| `sawtooth.containers.pbft_engine.imagePullPolicy` | imagePullPolicy for container | string | IfNotPresent |
| `sawtooth.containers.poet_cli.args` | extra args | string | nil |
| `sawtooth.containers.poet_cli.env` | list of environment name/valie dicts | map | nil |
| `sawtooth.containers.poet_cli.imagePullPolicy` | imagePullPolicy for container | string | IfNotPresent |
| `sawtooth.containers.poet_engine.args` | extra args | string | nil |
| `sawtooth.containers.poet_engine.env` | list of environment name/valie dicts | map | nil |
| `sawtooth.containers.poet_engine.imagePullPolicy` | imagePullPolicy for container | string | IfNotPresent |
| `sawtooth.containers.poet_validator_registry_tp.args` | extra args | string | nil |
| `sawtooth.containers.poet_validator_registry_tp.env` | list of environment name/valie dicts | map | nil |
| `sawtooth.containers.poet_validator_registry_tp.imagePullPolicy` | imagePullPolicy for container | string | IfNotPresent |
| `sawtooth.containers.rest_api` | settings group for all sawtooth rest-api container | map | N/A |
| `sawtooth.containers.rest_api.args` | extra args | string | nil |
| `sawtooth.containers.rest_api.env` | list of environment name/valie dicts | map | nil |
| `sawtooth.containers.rest_api.imagePullPolicy` | imagePullPolicy for container | string | IfNotPresent |
| `sawtooth.containers.settings_tp` | settings group for all sawtooth settings-tp container | map | N/A |
| `sawtooth.containers.settings_tp.args` | extra args | string | nil |
| `sawtooth.containers.settings_tp.env` | list of environment name/valie dicts | map | nil |
| `sawtooth.containers.settings_tp.imagePullPolicy` | imagePullPolicy for container | string | IfNotPresent |
| `sawtooth.containers.timekeeper.args` | extra args | string | nil |
| `sawtooth.containers.timekeeper.env` | list of environment name/valie dicts | map | nil |
| `sawtooth.containers.timeeeper.imagePullPolicy` | imagePullPolicy for container | string | IfNotPresent |
| `sawtooth.containers.validator.args` | extra args for validator | string | nil |
| `sawtooth.containers.validator.env` | list of environment name/valie dicts | map | nil |
| `sawtooth.containers.validator.imagePullPolicy` | imagePullPolicy for sawtooth validator container | string | IfNotPresent |
| `sawtooth.ports` | group defining sawtooth port parameters | map | N/A |
| `sawtooth.ports.sawnet` | port for the sawtooth validator network | int | 8800 |
| `sawtooth.ports.consensus` | port for the sawtooth consensus network | int | 5050 |
| `sawtooth.ports.sawcomp` | port for the sawtooth component network | int | 4004 |
| `sawtooth.ports.rest` | port for the sawtooth rest-api | int | 8008 |
| `sawtooth.livenessProbe.enabled` | whether to run the livenessProbe on the validator | boolean | false |
| `sawtooth.livenessProbe.initialDelaySeconds` | seconds to wait before running the liveness probe the first time | int | 300 |
| `sawtooth.livenessProbe.periodSeconds` | interval in seconds to re-run the liveness probe | int | 120 |
| `sawtooth.livenessProbe.active` | if false, the liveness probe will run and evaluate the the situation, but always return successfully | string | "false"
| `sawtooth.livenessProbe.exitSignals` | when restarting due to a livenessProbe failue, the validator pod has a "signal" system which will cause it to restart the named containers in this var | string | "block-info-tp" |
| `sawtooth.heartbeat` | group containing the heartbeat service settings | map | N/A |
| `sawtooth.heartbeat.interval` | interval in seconds to issue a heartbeat | int | 300 |
| `sawtooth.permissioned` | Whether to run this chain as a permissioned chain or not | boolean | false |
| `sawtooth.namespace` | namespace to render these templates into (deprecated) | string | "prod" |
| `sawtooth.networkName` | name of this sawtooth network (deprecated) | string | "mynetwork" |
| `sawtooth.scheduler` | name of the sawtooth transaction scheduler to use | string | "serial"
| `sawtooth.consensus` | id of the the consensus algorithm to use< valid values: 100:DevMode, 200, PoET, 300 - Raft, 400, PBFT | int | 200
| `sawtooth.genesis` | sawtooth genesis configuration block | map | N/A |
| `sawtooth.genesis.enabled` | If true, and the cluster is starting for the first time, then   a node will be selected to create and submit the genesis block | boolean | true |
| `sawtooth.genesis.seed` | The seed is an arbitrary string which identifies a given genesis  If the data of a given set of nodes is to be wiped out, change this value. | string | "9a2de774-90b5-11e9-9df0-87e889b0f1c9" |
| `sawtooth.dynamicPeering` | Dynamic Peering should default to false, since it is a bit unreliable  | boolean | false |
| `sawtooth.externalSeeds` | a list of maps defining validator endpoints external to this deployment | list | [] |
| `sawtooth.daml` | daml on sawtooth specific settings | map | N/A |
| `sawtooth.daml.trigger.extraArgs` | extra arguments for the daml trigger-service | string | nil |
| `sawtooth.daml.trigger.darId` | package id of the dar to download from the chain | string | nil |
| `sawtooth.daml.trigger.darFile` | path of a dar file to load into the trigger service | string | nil |
| `sawtooth.daml.trigger.minRestartInterval` | min-restart-interval argument to trigger-service | string | nil |
| `sawtooth.daml.trigger.maxRestartInterval` | max-restart-interval argument to trigger-service | string | nil |
| `sawtooth.daml.trigger.timeParam` | time parameter to trigger-service | string | nil |
| `sawtooth.daml.trigger.ttl` | ttl trigger-service | int | 30 |
| `sawtooth.daml.trigger.jdbcConfig` | JDBC config for  trigger-service | string | nil |
| `sawtooth.daml.trigger.extraVolumeMounts` | extra volume mounts for trigger service | list | []
| `sawtooth.daml.trigger.extraVolumes` | extra volumes declarations for trigger service | list | []
| `sawtooth.daml.maxInboundMessageSize` | GRPC Max inbound message size for daml-rpc | int | 10000000 |
| `sawtooth.daml.maxOpsPerBatch` | maximum number of Daml operations/commands which can be combined into a single sawtooth batch | int | 3 |
| `sawtooth.daml.maxOutstandingBatches` | maximum number of sawtooth batches to allow pending before waiting for completion | int | 1 |
| `sawtooth.daml.enabled` | whether to run daml here | boolean | true |
| `sawtooth.daml.extra_args.enabled` | enable to add extra arguments to daml rpc | boolean | false |
| `sawtooth.daml.extra_args.arg_str` | extra arguments to daml rpc | string | nil |
| `sawtooth.volumes` | volume settings for sawtooth | map | N/A |
| `sawtooth.hostPathBaseDir` | all sawtooth hostPath directories will be based here | string | /var/lib/btp
| `sawtooth.client_wait` | arbitrary delay to validator client startup, such as the rest-api | int | 90 |
| `sawtooth.customTPs` | a list of [custom tp definitions](#custom-tp-definitions) | list | nil |
| `jsonapi` | settings for the jsonapi | map | N/A |
| `jsonapi.ingress.enabled` | enable the ingress for the jsonapi | boolean | false |
| `jsonapi.ingress.annotations` | custom annotations for the jsonapi | map | {} |
| `jsonapi.ingress.hosts` | list of ingress host and path declarations for the jsonapi ingress | list | [] |
| `jsonapi` | settings for the trigger service | map | N/A |
| `trigger.ingress.enabled` | enable the ingress for the trigger-service | boolean | false |
| `trigger.ingress.annotations` | custom annotations for the trigger-service | map | {} |
| `trigger.ingress.hosts` | list of ingress host and path declarations for the trigger-service ingress | list | [] |
| `openssl.image` | the openssl.image is used generate certificates | map | N/A |
| `openssl.image.repository` | the image name | string | alpine/openssl |
| `openssl.image.tag` | the image tag to use | string | latest |
| `k8s.image` | the k8s.image is used for creation of the jwt secrets | map | N/A |
| `k8s.image.repository` | the image name | string | alpine/k8s |
| `k8s.image.tagrepository` | the image tag to use | string | 1.18.2 |
| `daml` | Grouping for general daml settings | map | N/A |
| `daml.auth` | DAML authentication settings | map | N/A |
| `daml.auth.enabled` | set to true to enable DAML authentication | boolean | false |
| `daml.trigger_service` | (deprecated) daml trigger service settings | map | N/A |
| `daml.trigger_service.enabled` | (deprecated) set true to enable trigger service | boolean | true |
| `daml.triggers` | settings for the individual trigger deployments which replaces the trigger-service | list [see trigger definitions](##triggers) | [] |
| `images` | a map containing all of the image urls used by this template| map | N/A |

## Images

| field | default |
|- |- |
| `images.postgres` | postgres:11
| `images.daml_trigger` | blockchaintp/daml-trigger-service:BTP2.1.0rc14
| `images.daml_json_api` | blockchaintp/daml-json-api:BTP2.1.0rc14
| `images.daml_rpc` | blockchaintp/sawtooth-daml-rpc:BTP2.1.0rc14
| `images.daml_tp` | blockchaintp/sawtooth-daml-tp:BTP2.1.0rc14
| `images.timekeeper` | blockchaintp/timekeeper:BTP2.1.0rc14
| `images.devmode_engine` | blockchaintp/sawtooth-devmode-engine-rust:BTP2.1.0rc14
| `images.pbft_engine` | blockchaintp/sawtooth-pbft-engine:BTP2.1.0rc14
| `images.poet_cli` | blockchaintp/sawtooth-poet-cli:BTP2.1.0rc14
| `images.poet_engine` | blockchaintp/sawtooth-poet-engine:BTP2.1.0rc14
| `images.poet_validator_registry_tp` | blockchaintp/sawtooth-poet-validator-registry-tp:BTP2.1.0rc14
| `images.raft_engine` | blockchaintp/sawtooth-raft-engine:BTP2.1.0rc14
| `images.block_info_tp` | blockchaintp/sawtooth-block-info-tp:BTP2.1.0rc14
| `images.identity_tp` | blockchaintp/sawtooth-identity-tp:BTP2.1.0rc14
| `images.intkey_tp` | blockchaintp/sawtooth-intkey-tp-go:BTP2.1.0rc14
| `images.settings_tp` | blockchaintp/sawtooth-settings-tp:BTP2.1.0rc14
| `images.shell` | blockchaintp/sawtooth-shell:BTP2.1.0rc14
| `images.validator` | blockchaintp/sawtooth-validator:BTP2.1.0rc14
| `images.rest_api` | blockchaintp/sawtooth-rest-api:BTP2.1.0rc14

## Triggers

Tiggers are described using maps of the following parameters

| field | description | required | type | default |
|- |- |- |- |- |
| `name` | kubernetes name of the trigger container | no | string | (system-determined) |
| `triggerName` | daml name of the trigger to be run | yes | string | nil |
| `darFile` | path of the dar file to use | yes | string | nil |
| `party` | name of the party to use | yes | string | nil |

## Custom TP Definitions

Custom TP definitions are describe using maps with the following fields

| field | description | type | default |
|-|-|-|-|
| `name` | name of the custom tp container(must be unique within the pod) | string | nil |
| `image` | url of the image for this tp | string | nil |
| `command` | list of command tokens for this tp | list | nil
| `arg` | list of arguments to the command | list | nil] |
