# These are the reasonable defaults file sawtooth 1.2

| field | description | type | default |
|-|-|-|-|
| `affinity.enabled` | false: no effect   true: then validators will be deployed only to k8s nodes with the label `app={{ .sawtooth.networkName }}-validator` | boolean | false  |
| `imagePullSecrets.enabled` | if true use the list of named imagePullSecrets | boolean | false |
| `imagePullSecrets.value` | a list if named secret references of the form   ```- name: secretName```| list | [] |
| `pagerduty.enabled` | if true send pagerduty alerts | boolean | false |
| `pagerduty.token` | pagerduty user token | string | nil |
| `pagerduty.serviceid` | pagerduty serviceid | string | nil |
| `sawtooth.opentsdb.db` | name of the opentsdb database to be used | string | metrics |
| `sawtooth.opentsdb.url` | url of the opentsdb database to be used | string | nil |
| `sawtooth.opentsdb.enabled` | whether to enable the opentsdb metrics | boolean | false |
| `sawtooth.minReadySeconds` | the minimum time a pod must be Running before proceeding on a rolling update | int | 120 |
| `sawtooth.maxUnavailable` | maximum number of pods allowed down on a rollout or update  | int | 1 |
| `sawtooth.containers.block_info.args` | extra args for block-info-tp | string | nil |
| `sawtooth.containers.identity_tp.args` | extra args for identity-tp | string | nil |
| `sawtooth.containers.rest_api.args` | extra args for rest-api | string | nil |
| `sawtooth.containers.settings_tp.args` | extra args for settings-tp | string | nil |
| `sawtooth.containers.validator.args` | extra args for validator | string | nil |
| `sawtooth.containers.validator.env` | list of environment name/value dicts | map | nil |
| `sawtooth.ports.sawnet` | port for the sawtooth validator network | int | 8800 |
| `sawtooth.ports.consensus` | port for the sawtooth consensus network | int | 5050 |
| `sawtooth.ports.sawcomp` | port for the sawtooth component network | int | 4004 |
| `sawtooth.ports.rest` | port for the sawtooth rest-api | int | 8008 |
| `sawtooth.livenessProbe.enabled` | whether to run the livenessProbe on the validator | boolean | false |
| `sawtooth.livenessProbe.initialDelaySeconds` | seconds to wait before running the liveness probe the first time | int | 300 |
| `sawtooth.livenessProbe.periodSeconds` | interval in seconds to re-run the liveness probe | int | 120 |
| `sawtooth.livenessProbe.active` | if false, the liveness probe will run and evaluate the the situation, but always return successfully | string | "false"
| `sawtooth.livenessProbe.exitSignals` | when restarting due to a livenessProbe failure, the validator pod has a "signal" system which will cause it to restart the named containers in this var | string | "block-info-tp" |
| `sawtooth.heartbeat.interval` | interval in seconds to issue a heartbeat | int | 300 |
| `sawtooth.permissioned` | Whether to run this chain as a permissioned chain or not | boolean | false |
| `sawtooth.namespace` | namespace to render these templates into (deprecated) | string | "prod" |
| `sawtooth.networkName` | name of this sawtooth network (deprecated) | string | "mynetwork" |
| `sawtooth.scheduler` | name of the sawtooth transaction scheduler to use | string | "serial"
| `sawtooth.consensus` | id of the the consensus algorithm to use< valid values: 100:DevMode, 200, PoET, 300 - Raft, 400, PBFT | int | 200
| `sawtooth.genesis.enabled` | If true, and the cluster is starting for the first time, then   a node will be selected to create and submit the genesis block | boolean | true |
| `sawtooth.genesis.seed` | The seed is an arbitrary string which identifies a given genesis  If the data of a given set of nodes is to be wiped out, change this value. | string | "9a2de774-90b5-11e9-9df0-87e889b0f1c9" |
| `sawtooth.dynamicPeering` | Dynamic Peering should default to false, since it is a bit unreliable  | boolean | false |
| `sawtooth.externalSeeds` | a list of maps defining validator endpoints external to this deployment | list | [] |
| `sawtooth.seth.enabled` | enabled sawtooth-seth | boolean | false |
| `sawtooth.xo.enabled` | enabled sawtooth-xo-tp | boolean | false |
| `sawtooth.smallbank.enabled` | enabled sawtooth-smallbank-tp | boolean | false |
| `sawtooth.hostPathBaseDir` | all sawtooth hostPath directories will be based here | string | /var/lib/btp
| `sawtooth.client_wait` | arbitrary delay to validator client startup, such as the rest-api | int | 90 |
| `sawtooth.customTPs` | a list of [custom tp definitions](#custom-tp-definitions) | list | nil |
| `sawtooth.affinity` | custom affinity rules for the sawtooth validator deamonset | map | nil |
| `images` | a map containing all of the image urls used by this template| map | N/A |

## Images

| field | default |
|- |- |
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
| `images.smallbank_tp` | blockchaintp/sawtooth-smallbank-tp-go:BTP2.1.0rc14
| `images.validator` | blockchaintp/sawtooth-validator:BTP2.1.0rc14
| `images.xo_tp` | blockchaintp/sawtooth-xo-tp-go:BTP2.1.0rc14
| `images.rest_api` | blockchaintp/sawtooth-rest-api:BTP2.1.0rc14
| `images.seth_rpc` | blockchaintp/sawtooth-seth-rpc:BTP2.1.0rc13
| `images.seth_tp` | blockchaintp/sawtooth-seth-tp:BTP2.1.0rc13
| `images.xo_demo` | blockchaintp/xo-demo:BTP2.1.0rc14

## Custom TP Definitions

Custom TP definitions are describe using maps with the following fields

| field | description | type | default |
|-|-|-|-|
| `name` | name of the custom tp container(must be unique within the pod) | string | nil |
| `image` | url of the image for this tp | string | nil |
| `command` | list of command tokens for this tp | list | nil
| `arg` | list of arguments to the command | list | nil] |
