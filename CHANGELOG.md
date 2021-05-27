# CHANGELOG

## Unreleased

* fix(daml-on-besu): local bootnodes onlywhen seed [view commit](https://github.com/catenasys/helm-charts/commit/48987eebfc47bc1a2e28ad3640f07f2d866ee169)
* fix:(daml-on-besu) change besu bootnode strategy [view commit](https://github.com/catenasys/helm-charts/commit/7639ed7ab3658f4ef61cf0f40293dedc5c65e354)
* feat(sawtooth): add pagerduty-alert [view commit](https://github.com/catenasys/helm-charts/commit/aaa1f8942910ff55a1acc2c0f2565ddfcd2079a5)
* feat(taekion-middleware): add a service for the middleware so we can get to it via k8s api server [view commit](https://github.com/catenasys/helm-charts/commit/3f88f7edef6f6f58b6044cc1c67131c043061e3d)
* refactor(besu): align filenames b/w besu and daml-on-besu [view commit](https://github.com/catenasys/helm-charts/commit/396024c0f1a23bd9aa90c1ec2fb6388101623c04)
* feat(besu): add default readiness and liveness probes to besu impls [view commit](https://github.com/catenasys/helm-charts/commit/0683b30b2014f8496723ae908038f861e5d028e2)
* feat(daml-on-postgres): add jsonapi [view commit](https://github.com/catenasys/helm-charts/commit/3a87a0b9e149e2f41036e9c12653e00e2ef0a679)
* feat(daml-on-besu): add jsonapi [view commit](https://github.com/catenasys/helm-charts/commit/d0ec433e2744eaa1895bd613aa240a475161b3b2)
* feat(daml-on-besu): add annotations option for besu and daml-rpc statefulsets [view commit](https://github.com/catenasys/helm-charts/commit/6f70c1645b4772acbc19eb2cbc81d04f3f0925bf)
* feat(besu): bump chart version [view commit](https://github.com/catenasys/helm-charts/commit/c9b88f1a1e7b728f2cb1ed4101372355413a7bff)
* feat(besu): add secondary network capabilities [view commit](https://github.com/catenasys/helm-charts/commit/d7f1a461e5f269b6abaf0201882040cc01b45c00)
* fix(daml-on-besu): remove extraneous labels on SS [view commit](https://github.com/catenasys/helm-charts/commit/6e98c28d9b4424697430ff7f50bee1a17a3182a5)

## v0.2.45

* feat(daml-on-besu): besu child network capabilities [view commit](https://github.com/catenasys/helm-charts/commit/1e0982adba4d17c4b3c505aad9ad3beeb57e4d33)
* feat(daml-on-besu): allow arbitrary affinity rules to be set for the statefulset [view commit](https://github.com/catenasys/helm-charts/commit/bbad9e4b31fe17b9d453a2c0e599a473a5b5ae6f)
* feat(besu): allow arbitrary affinity rules to be set for the statefulset [view commit](https://github.com/catenasys/helm-charts/commit/29fe018385ab4be1a14d34f2bb57b77cec2b0306)

## v0.2.44

* feat(daml-on-besu): update chart version [view commit](https://github.com/catenasys/helm-charts/commit/fc7afc98f28ec9830d2dafe39e822615efdbb3c5)
* docs(daml-on-besu): add multiple network documents [view commit](https://github.com/catenasys/helm-charts/commit/6e2ce103d9649a3baeb10da7522aa2bcdef67273)
* feat(daml-on-besu): add pod specific services to each besu node to maintain a stable endpoint [view commit](https://github.com/catenasys/helm-charts/commit/ce2662c0e7b8b43ee7361cb51b3312cc961f2f06)
* feat(daml-on-besu): add capabilities to connect to a remote besu network [view commit](https://github.com/catenasys/helm-charts/commit/994af1e75f65d221c82b2f46f018ea82ceab8e49)

## v0.2.43

* fix: correct cert names in d-o-p and d-o-b [view commit](https://github.com/catenasys/helm-charts/commit/42bd2e5e3b59c7bdcb159b5f66532cafc2613f79)
* docs(daml-on-sawtooth): correct values file markdown [view commit](https://github.com/catenasys/helm-charts/commit/351fa37929f3236367cecc21f209dcfebef08de0)
* fix(daml-on-sawtooth): remove affinity rule switch and set from daml values [view commit](https://github.com/catenasys/helm-charts/commit/87bac686ca06053efa8bd9cd62b24232a52dbb19)
* feat(sawtooth): allow setting arbitrary affinity rules [view commit](https://github.com/catenasys/helm-charts/commit/c5a8a0ff513e4cf0b4a5be1956f21e34ad972dcf)
* feat(daml-on-sawtooth): allow setting arbitrary affinity rules [view commit](https://github.com/catenasys/helm-charts/commit/034b32e08ff278eb93be0f8e646ce430ff173043)
* test(pre-commit-config): autoupdate hook repos [view commit](https://github.com/catenasys/helm-charts/commit/cb2d79f20eb9d7e8dddc988c65c29ecb599df1de)
* fix(daml-on-postgres): correct daml certificate name [view commit](https://github.com/catenasys/helm-charts/commit/d59021d5b414c794d9573ffe63386cd5d334b4f2)

## v0.2.42

* fix(daml-on-postgres): corrections to form [view commit](https://github.com/catenasys/helm-charts/commit/bccd0bd1868e06f8a06c68cc5ff1ec07908ce697)
* fix(daml-on-postgres): port isn't a dns1123 field, and for now give Host a default [view commit](https://github.com/catenasys/helm-charts/commit/a2c93b80f432bb28f3f3f634bb7979ea5841271b)
* fix(sawtooth): deprecate seth and sample applications [view commit](https://github.com/catenasys/helm-charts/commit/9edf4e0cb4b5ac6100009b1aabef42db36383441)
* fix(sextant-test): correct image urls [view commit](https://github.com/catenasys/helm-charts/commit/c2313bb295796aaa90aad4c0c43cb7527948d823)
* fix(sextant-test): correct values.yaml [view commit](https://github.com/catenasys/helm-charts/commit/289f45e50240d58ed0f9c0ab92023a473f843a3d)
* docs(sextant): update sextant documentation [view commit](https://github.com/catenasys/helm-charts/commit/2151d746d6f83be4822d6e338d1add07c076a77f)

## v0.2.41

* fix(daml-on-postgres): correct extra_args processing [view commit](https://github.com/catenasys/helm-charts/commit/1b10a594e05d359cf4d2248fe6f572941ebc2a30)
* fix(daml-on-besu): correct extra-args processing [view commit](https://github.com/catenasys/helm-charts/commit/bc2844490c163fbbfe81875c7391098097b7af88)

## v0.2.40

* feat(daml-on-sawtooth): enable signals on the remaining containers [view commit](https://github.com/catenasys/helm-charts/commit/bf2d8610fde59e246539f17161dd0f12c5029a7a)
* fix(daml-on-sawtooth): correct a typo in the atomicwrite cleanup [view commit](https://github.com/catenasys/helm-charts/commit/83e1d1e1358e2d8b06ce87e8c0381a8b57dfb073)

## v0.2.39

* fix(daml-on-sawtooth): add serviceName to statefulset [view commit](https://github.com/catenasys/helm-charts/commit/9be7c4059b32197d1f6ffad999cfbbb07527f03d)

## v0.2.38

* feat(daml-on-sawtooth): add persistence options for postgres [view commit](https://github.com/catenasys/helm-charts/commit/2e23f19cfec0787c12e657afefe7036f8d0babd8)

## v0.2.37

* fix: fix scoping in triggers [view commit](https://github.com/catenasys/helm-charts/commit/1a057c4e43ed65e3ba8ccbf733926db5169a15b8)

## v0.2.36

* feat(daml-on-sawtooth): add extraVolumeMounts across rpc pod [view commit](https://github.com/catenasys/helm-charts/commit/68533944f7365b7e92d73d1ed850734af304c269)
* fix: correct extra_args parsing for daml-rpc [view commit](https://github.com/catenasys/helm-charts/commit/c3ad22764f15bd9f691ee85a4c90c4ffdfd7f00a)

## v0.2.35

* feat(sawtooth): resource configuration [view commit](https://github.com/catenasys/helm-charts/commit/b7502675a28f104c12432e2ec9b5563f5487459b)
* feat(daml-on-sawtooth): add individual daml-triggers SXT-566 [view commit](https://github.com/catenasys/helm-charts/commit/61e9121f54feb8984e0f80ef99cc31ae203f891a)
* fix(daml-on-sawtooth): update documentation SXT-566 [view commit](https://github.com/catenasys/helm-charts/commit/285031c71f62495e1c985c8f5b9fb2d1166928e4)
* fix(sawtooth): update sawtooth documentation SXT-566 [view commit](https://github.com/catenasys/helm-charts/commit/9dafbb7cc34d282f1d3b57dba597c295c972d439)
* fix(sawtooth): remove .atomicwrite directories before validator startup SXT-588 [view commit](https://github.com/catenasys/helm-charts/commit/53563ee996853f5330e4d36e9de104ea44219d33)

## v0.2.34

* fix(daml-on-sawtooth): wait until all signals are received before starting [view commit](https://github.com/catenasys/helm-charts/commit/4a7a0c5a23686d7ea9e1755bee6c2874e1b9a91b)
* refactor(tfs-on-sawtooth): resolve differences with other stl charts [view commit](https://github.com/catenasys/helm-charts/commit/32101f1e4eb41f7df0b8c0a1e55f1113d971c2fd)
* refactor(sawtooth): additional whitespace changes [view commit](https://github.com/catenasys/helm-charts/commit/e28a0c8b11c3e8c6ae3cbecb77c112631828952d)
* refactor(tfs-on-sawtooth): rename templates [view commit](https://github.com/catenasys/helm-charts/commit/4ec7a6d1e0c18bd5707dd31daa04b3dafcd7069a)
* refactor(sawtooth): resolve differences between sawtooth and other stl charts [view commit](https://github.com/catenasys/helm-charts/commit/01e72368204dedd3193d9aa4c027bbd9aaf80178)
* fix(daml-on-sawtooth): resolve differences between d-o-s and other sawtooth charts [view commit](https://github.com/catenasys/helm-charts/commit/242556856f1307c215f728b8e557576b3490902b)
* fix(besu): set default besu image location to dockerhub SXT-549 [view commit](https://github.com/catenasys/helm-charts/commit/bb3d98f5d0d87523d1fc11cdf9966228b75ba6c8)

## v0.2.33

* fix(daml-on-sawtooth): reduce failureThreshold and periodSeconds on signals based probes SXT-574 [view commit](https://github.com/catenasys/helm-charts/commit/326daebe0d2630f0b439f03bad83a5f26d69f84f)

## v0.2.32

* fix(daml-on-sawtooth): make uniform container args and env paramets as well as imagePullPolicy [view commit](https://github.com/catenasys/helm-charts/commit/4be61568c14667c3a372a6e14156108ad33cb34c)

## v0.2.31

* fix(daml-on-sawtooth): correct entrypoints should be foreground [view commit](https://github.com/catenasys/helm-charts/commit/d2a01efd1ab37b2661c19cf90a5de456bfd1463b)
* fix(daml-on-sawtooth): missing mount names [view commit](https://github.com/catenasys/helm-charts/commit/cd7fa98c2ee4c0d41ffef70cdc12e4d894582b34)
* fix(daml-on-sawtooth): add new signals system [view commit](https://github.com/catenasys/helm-charts/commit/cfc72d77b0e568a7ffda1d1be390c985a444ebb6)
* feat(daml-on-sawtooth): make trigger service optional and default to false SXT-565 [view commit](https://github.com/catenasys/helm-charts/commit/fb957d847b131b39673d520790fe7bd3e6499d2c)
* fix(daml-on-postgres): fix typos in form [view commit](https://github.com/catenasys/helm-charts/commit/085d376bcf978300feb2174e59cabc24eac53466)
* fix(daml-on-postgres): bump chart versionn [view commit](https://github.com/catenasys/helm-charts/commit/41dc79a7d6c54effbecf2e2281c1f304670d08d8)
* fix(daml-on-postgres): update helper text in form [view commit](https://github.com/catenasys/helm-charts/commit/01b99e1698c2315db06cfcb3149b7609412f9694)
* style(daml-on-qldb): bump chart subminor version [view commit](https://github.com/catenasys/helm-charts/commit/52efa57d1fb57565fda04b2ab8f724b8fec00ce2)
* fix(daml-on-qldb): disallow capital letters in ledger id [view commit](https://github.com/catenasys/helm-charts/commit/5888370edf4230b5c7d20fdc7471454b36ab9f36)
* fix(daml-on-postgres): bump chart version minor [view commit](https://github.com/catenasys/helm-charts/commit/63c2dc1c21cefa95c587f45faeebd91f24b996bb)
* feat(daml-on-sawtooth): storage class form field is linked to 2 other fields [view commit](https://github.com/catenasys/helm-charts/commit/d34518f1bf13265e96f8431fe0ea487574999cf7)
* fix(dalm-on-postgres): update form fields and options for postgres enabled [view commit](https://github.com/catenasys/helm-charts/commit/f72c34a1e6fe43c3451ad87990c18e26c9add7fe)

## v0.2.30

* fix: jsonapi arge to use a range and now be quoted [view commit](https://github.com/catenasys/helm-charts/commit/026d3e174099fbc4b50042261be84f7b9e37f982)

## v0.2.29

* fix(charts): correct environment var declarations [view commit](https://github.com/catenasys/helm-charts/commit/c12332f360aefb2c2df977e352dc4f1e6872ea06)

## v0.2.28

* fix(daml-on-besu): sdk v1.4 began defaulting the ledger id to a random, set instead to default-ledger-id [view commit](https://github.com/catenasys/helm-charts/commit/4096844253f033736b14ca25ca89b3f8dbd31b1b)
* fix(daml-on-besu): improvements to the d-o-b chart to improve resiliency SXT-518 [view commit](https://github.com/catenasys/helm-charts/commit/4c0c7f6d0524992cd41effb55dae4e65766c5bdd)

## v0.2.27

* fix(sextant): correct label in NOTES.txt SXT-482 [view commit](https://github.com/catenasys/helm-charts/commit/03bdfc25385fae93e14899b852769ba4fdf7bac1)

## v0.2.26

* fix: promote BTP2.1.0rc14 SXT-511 [view commit](https://github.com/catenasys/helm-charts/commit/f9642c3d13eaba2f16d7caf79701049d5b9021b7)

## v0.2.25

* fix(daml): correct secret volume mount name SXT-511 [view commit](https://github.com/catenasys/helm-charts/commit/ae7626f19bed14bccd57b0d58710840a533fe3a1)
* fix(daml): correct secret name SXT-511 [view commit](https://github.com/catenasys/helm-charts/commit/c758bdf5f27ac518594a635f2e0ffba8493545fd)
* build(pre-commit): update pre-commit SXT-511 [view commit](https://github.com/catenasys/helm-charts/commit/ecf9526e19a09891471a8ee3f0e62d3b0e3304b3)
* fix(sextant): correct NOTES.txt for pod selection [view commit](https://github.com/catenasys/helm-charts/commit/8512d5040ba3dddc11326121ed209831a5a483af)
* fix(daml-on-qldb): disable daml ui features for the time being until daml-sdk for qldb is updated [view commit](https://github.com/catenasys/helm-charts/commit/dfb049fba2f393ffe302bdbedfd294a1eddc25a0)
* fix(daml-on-besu): remove constant --logging arg [view commit](https://github.com/catenasys/helm-charts/commit/57f91e6e868af85df5bb7475528354ec400ef14f)
* fix(daml): add auth method arguments and correct extra_args template SXT-511 [view commit](https://github.com/catenasys/helm-charts/commit/65601ee04f228a1b748afc2c63962b5ba3048d6f)
* fix(daml): specify values.yaml default for auth SXT-511 [view commit](https://github.com/catenasys/helm-charts/commit/821d9c3929b761514d16517cea9ef70f0181f0ac)
* fix(daml): mount jwt-secret SXT-511 [view commit](https://github.com/catenasys/helm-charts/commit/9c3f43bdc016f7654f65ea9e30a65e6f52d419d5)
* fix(daml-jwt): add the secret roles to the other flavours of DAML deployment [view commit](https://github.com/catenasys/helm-charts/commit/d072b7240dd41dca2e5e40d1349ef4f924b71084)
* fix(daml-jwt): include secrets in role so we can create a jwt secret in the startup job [view commit](https://github.com/catenasys/helm-charts/commit/b166f680517fd6660727e2664b74edfdf4dbee0c)
* fix(daml-jwt): containers run in parallel so wait for file to appear before proceeding [view commit](https://github.com/catenasys/helm-charts/commit/a9d87039e2e6dd2fc21a20479b971174f5b4aeed)
* fix(daml-jwt): fix typo in daml jwt job [view commit](https://github.com/catenasys/helm-charts/commit/9c542320f3862515508f80589f2a9331e73bb8d0)
* feat: add rsa certificate generation to daml charts [view commit](https://github.com/catenasys/helm-charts/commit/7fd2bca04280282b2f9ab46be553cc2450dc495b)
* build: add Makefile [view commit](https://github.com/catenasys/helm-charts/commit/30d580e53086418f3b57ae6ca320aeac708bfba9)
* refactor: move docker tool to subdir and rework [view commit](https://github.com/catenasys/helm-charts/commit/cc8191ddb9944cff81658905e27e32ae90c962cf)
* build(pre-commit): correct exclusion declarations [view commit](https://github.com/catenasys/helm-charts/commit/b24b23a1d1fe44a134a083322a855ad1bfe6100b)
* refactor: correct helm lint issues in all charts [view commit](https://github.com/catenasys/helm-charts/commit/2a463cee2236d71f6948c9b214e18c7b8b8057fe)

## v0.2.24

* fix(daml-on-sawtooth): remove probe data files on restart of validator [view commit](https://github.com/catenasys/helm-charts/commit/1c03540d4fcdf262572408debd99004280806be9)

## v0.2.23

* fix(daml-on-sawtooth): correct lifecycle declaration [view commit](https://github.com/catenasys/helm-charts/commit/68ec839fe38ac68ada7610e99071bdebaf3ed357)
* fix(daml-on-sawtooth): move exit signals to preStop lifecycle [view commit](https://github.com/catenasys/helm-charts/commit/039701eac29528c1904850f1232fefa72988c4b3)

## v0.2.22

* fix(daml-on-sawtooth): fix command line [view commit](https://github.com/catenasys/helm-charts/commit/5b0097a9b33f57dedb5885bf272202320e095f00)
* fix(daml-on-sawtooth): correct syntax error in validator script section [view commit](https://github.com/catenasys/helm-charts/commit/a5c5429a6ae2662676f33364fb7ce562a8f9a7ce)
* fix(daml-on-sawtooth): add exit for signals to validator container [view commit](https://github.com/catenasys/helm-charts/commit/e4b100db51ce57b3b750b5f96821dd047ed441c2)

## v0.2.21

* fix(daml-on-sawtooth): correct signals directory as a mitigation until liveness probe is corrected [view commit](https://github.com/catenasys/helm-charts/commit/a56750bb35b6811e4b0b0b09490595b76a40d8ae)
* fix(daml-on-sawtooth): correct SIGNALS_DIR [view commit](https://github.com/catenasys/helm-charts/commit/5b7819a13ecbb6b7cb29b26287375c574101c56b)
* fix(daml-on-sawtooth): add signals volume [view commit](https://github.com/catenasys/helm-charts/commit/bd6af865d55918dfd2ec3fe8068b6e402608a4b0)
* fix(daml-on-sawtooth): correct kill command [view commit](https://github.com/catenasys/helm-charts/commit/ebc49e60308f2354c8a57323ece0444766a49007)
* fix(daml-on-sawtooth): add pbft-engine signal support and use by default [view commit](https://github.com/catenasys/helm-charts/commit/a9529ca474c7ffdc0f71b9c63e856e9f383523c9)

## v0.2.20

* fix(sextant-details): fix punctuation errors [view commit](https://github.com/catenasys/helm-charts/commit/c6463cdac543e0b30b2ba1a7531309c1b4afb0a0)
* fix(form): fix typo in image pull secret helper text [view commit](https://github.com/catenasys/helm-charts/commit/982b949b712cf4732ed1056ae816f0abf7e245af)
* fix(details): update the displayed logo [view commit](https://github.com/catenasys/helm-charts/commit/726cf8e5347d2aa50ebf76c2e50757fa90b2bb1c)
* fix(forms): display deployment type in form header [view commit](https://github.com/catenasys/helm-charts/commit/3b989555271c87939297620f4b9e73674e79608d)
* fix(forms): remove affinity option from non-sawtooth forms [view commit](https://github.com/catenasys/helm-charts/commit/93141c501f7174a72ee11d178eda85e3ccce6974)
* fix(forms): make deployment name subtext uniform [view commit](https://github.com/catenasys/helm-charts/commit/1278cc3cb864beca98c39576ec809d82e76626ec)
* fix(tfs-details): update description and sawtooth version [view commit](https://github.com/catenasys/helm-charts/commit/d8da30f8044541a238aa4fa9f8d2291b90106095)
* fix(sawtooth-details): update display name and description [view commit](https://github.com/catenasys/helm-charts/commit/af6b6692036ae57e4d6a06bafc055cf741bd902e)
* fix(besu-details): update deisplay name and description [view commit](https://github.com/catenasys/helm-charts/commit/67ee41647f370712eb2362b13b61d740c4b433c3)
* feat(details-yaml): update logo image name for new tfs logo [view commit](https://github.com/catenasys/helm-charts/commit/6ef7ae04b12d4e27a7aecf0e934d7a459ae9a344)
* refactor(chart-yaml): bump chart version [view commit](https://github.com/catenasys/helm-charts/commit/911b3ef3cb5c2824cd44a4a1e7cf94ac36753b71)

## v0.2.19

* fix(daml-on-sawtooth): add trigger service port to daml-rp service [view commit](https://github.com/catenasys/helm-charts/commit/0b475714794f38c8ad3453a0f795a6f56b19d41a)

## v0.2.18

* fix(daml-on-sawtooth): correct trigger ingress name [view commit](https://github.com/catenasys/helm-charts/commit/6ac56188f16509a072e91ac80886234dd2c84afc)

## v0.2.17

* fix(daml-on-sawtooth): add jsonapi args [view commit](https://github.com/catenasys/helm-charts/commit/a40d6a1be24b3e674fd0f436cb8b9324db1255fa)
* fix(daml-on-sawtooth): add jsonapi args [view commit](https://github.com/catenasys/helm-charts/commit/1b186e227733999bff32d01e2dbdcda1c688482a)

## v0.2.16

* fix(daml-on-sawtooth): correct trigger http port default [view commit](https://github.com/catenasys/helm-charts/commit/71a9bc4f3ef182c464dcfe86635f3d781250e86f)

## v0.2.15

* fix(daml-on-sawtooth): add initContainer to change extraMounts permissions [view commit](https://github.com/catenasys/helm-charts/commit/63d0961e852ad36835ff1717637937448df8d56c)
* fix(daml-on-sawtooth): add extraVolumeMounts capability [view commit](https://github.com/catenasys/helm-charts/commit/e5e165c003650336330806db3bfae6ed6ba987d3)
* fix(daml-on-sawtooth): set to rc11 [view commit](https://github.com/catenasys/helm-charts/commit/e1e5c8b1a146df6497dd8cc68e1376021944a862)
* fix(daml-on-sawtooth): add daml-trigger-service [view commit](https://github.com/catenasys/helm-charts/commit/d1a720f78404983ac5fcfc2ab1a48ac9d96ba15e)

## v0.2.14

* fix(daml-on-sawtooth): correct daml-tp env indentation [view commit](https://github.com/catenasys/helm-charts/commit/73af962ce3b017523ad127352d12edee292ee606)
* fix(daml-on-sawtooth): remove cpu limit on daml-tp and enable env parsing [view commit](https://github.com/catenasys/helm-charts/commit/b86dfa909919b8f8b504fe4c8013c22b04a960e1)
* fix(daml-on-sawtooth): increase cpu limit for daml-tp [view commit](https://github.com/catenasys/helm-charts/commit/a660c8b91deef43882b3ec70bdc43940fc616ba1)

## v0.2.13

* fix(daml-on-sawtooth): remove genesis files on reseed [view commit](https://github.com/catenasys/helm-charts/commit/fae894a58faffcc33bbe98cf07700587fd20efef)
* fix(daml-on-sawtooth): source the genesis scripts [view commit](https://github.com/catenasys/helm-charts/commit/6704ef6cb8c0aef938d9e14609f0fc06c844a44b)
* fix(daml-on-sawtooth): quote environment vals [view commit](https://github.com/catenasys/helm-charts/commit/fa0032eb2284693a889f87668a096a35deb8da64)
* fix(daml-on-sawtooth): correct typo [view commit](https://github.com/catenasys/helm-charts/commit/1c762997571aeea394f93efab837c901f70c60cf)
* fix(daml-on-sawtooth): add configurables for max-ops-per-batch and max-batches-outstanding [view commit](https://github.com/catenasys/helm-charts/commit/b2c697710b7459edd78f53b1a8da4b7cbd8b5f67)
* add args to various containers [view commit](https://github.com/catenasys/helm-charts/commit/5fe79793cab370be9e6fc39c9fddd2f2b362c2be)
* fix(daml-on-sawtooth): remove default logging args [view commit](https://github.com/catenasys/helm-charts/commit/1251209a25d365d9dca3f2bc329ed8cf49d3e9e4)
* fix(daml-on-sawtooth): add args to various containers [view commit](https://github.com/catenasys/helm-charts/commit/41749c7f54414736aaf93b66d1c2dceb82fa22eb)
* fix(daml-on-besu): add extra_args to daml-on-besu rpc [view commit](https://github.com/catenasys/helm-charts/commit/30000e1f89324549f14d49c6bcbb780109b55d64)
* fix(forms): use deployment name instead of network name [view commit](https://github.com/catenasys/helm-charts/commit/ac044651f445a00d49ba8e360a05213530d07de7)

## v0.2.12

* fix(sawtooth): and daml-on-sawtooth remove /etc/sawtooth/initialized on reseed [view commit](https://github.com/catenasys/helm-charts/commit/e7f5380813db85d43fc6a4bc4905e7d3ff5833ab)

## v0.2.11

* fix(daml-on-besu): fix typo in private besu startup [view commit](https://github.com/catenasys/helm-charts/commit/475802c18c0b2d236126861fdb2e56353b9280c6)

## v0.2.10

* fix(daml-on-besu): fix typo in values [view commit](https://github.com/catenasys/helm-charts/commit/a3be9fe4db944c345ad024b6ee204e9e07d20b87)

## v0.2.9

* fix(daml-on-besu): fix typo in genesis cm [view commit](https://github.com/catenasys/helm-charts/commit/bf03f7478abd6b11cdcb709ccf88ea932c1022c0)

## v0.2.8

* fix(daml-on-besu): allocate DAML precompile accounts in genesis [view commit](https://github.com/catenasys/helm-charts/commit/7fd921f57edec880761764e933205b75cc63563a)
* fix(daml-on-besu): fix typo in besu.privateImage [view commit](https://github.com/catenasys/helm-charts/commit/18dc501cc3da042ac493c19457e8eb38a3ab773b)
* fix(daml-on-besu): fix typo [view commit](https://github.com/catenasys/helm-charts/commit/b6ac05091845b16b46d39397d669aec648d5ef51)
* fix(daml-on-besu): add daml private options [view commit](https://github.com/catenasys/helm-charts/commit/ed0da38be93c3355f3adf2610396533c397cafdd)
* fix(postgres): update PGDATA directories to use a subdir [view commit](https://github.com/catenasys/helm-charts/commit/386a9e9bf1aa6d98e56140fe58fe4f54d5070c95)
* fix(daml-on-besu): change PGDATA to a subdir [view commit](https://github.com/catenasys/helm-charts/commit/118ba050977703eb3bd5967f5b5480dca774b08a)
* fix(daml-on-besu): change postgres data directory [view commit](https://github.com/catenasys/helm-charts/commit/3453c6a7888a11b0671e9359b2d5bfaf38292fdc)
* fix(pipeline): correct unstable publishing [view commit](https://github.com/catenasys/helm-charts/commit/044610246f53f8006128ca226ebd15958484c146)
* fix(pipeline): correct unstable publishing [view commit](https://github.com/catenasys/helm-charts/commit/dd1a868dc12045e5c18a8124484d95cdb8e02f50)
* fix(postgres): add PGDATA vars to postgres initialization to prevent wipeouts [view commit](https://github.com/catenasys/helm-charts/commit/eb3a1c97059c216c2d137478fc14571082c9afd6)
* fix(pipeline): correct unstable publishing [view commit](https://github.com/catenasys/helm-charts/commit/0b1ff6ab7ad238df0c19c8be6494d33ca979a3c6)
* fix(pipeline): always publish to unstable on the master branch [view commit](https://github.com/catenasys/helm-charts/commit/70323965d2481b7db3f3b97d05303d821e7b91e3)

## v0.2.7

* fix(daml-on-besu): change default besu datapath and reference [view commit](https://github.com/catenasys/helm-charts/commit/45339141c4b2c1a4c7a2b83e5335fc659ed2f6d8)

## v0.2.6

* fix(sawtooth): update external seeds hostname field regex [view commit](https://github.com/catenasys/helm-charts/commit/5f9937318d8916644172f1959bb60b94184a939e)
* fix(daml-on-sawtooth): update external seeds hostname field regex [view commit](https://github.com/catenasys/helm-charts/commit/21c1838e595a1eabbef374610d99cfaa45f6eab6)
* fix(form): persistence enabled form fields not null or visible by default [view commit](https://github.com/catenasys/helm-charts/commit/86d739c335dd1b829225268705c25434c575efe9)
* refactor(chart): bump chart version [view commit](https://github.com/catenasys/helm-charts/commit/a4cde207119038200243263568bc424c54c01938)

## v0.2.5

* fix(daml-on-postgres): correct daml-rpc service name [view commit](https://github.com/catenasys/helm-charts/commit/021491e5bdd1a5c8d3c085d1ecb56ce281b94b79)
* fix(daml-on-postgres): correct daml-service declaration [view commit](https://github.com/catenasys/helm-charts/commit/50644bab5558b0f1b810b96c2b36bb970c2414af)
* fix(daml-on-postgress): add ingress for jsonapi [view commit](https://github.com/catenasys/helm-charts/commit/439fa892014c1fd98a446ebf1d48b188ff90f48d)
* fix(daml-on-sawtooth): add ingress for jsonapi [view commit](https://github.com/catenasys/helm-charts/commit/39af2ef34cd4e6f0af5e84583340cdfc23f6949c)
* fix(daml-on-sawtooth): correct env quoting [view commit](https://github.com/catenasys/helm-charts/commit/13f69365a5d4665eedc7a6e5ce1dbc0d35ca98fb)
* fix(daml-on-postgres): correct environment quoting [view commit](https://github.com/catenasys/helm-charts/commit/1451f3f5fed59e6181a05ac0752cda60a93c9b24)
* fix(daml-on-postgres): add json-api to daml-on-postgres [view commit](https://github.com/catenasys/helm-charts/commit/3c2f37540bfdb4c640d86f96eeaab713b5c2c36a)
* fix(daml-on-sawtooth): correct env declaration for jsonapi [view commit](https://github.com/catenasys/helm-charts/commit/6de3c0ae8b41fcb444bb3a57f82092eadebc0bb8)
* fix(daml-on-sawtooth): updates to use jsonapi [view commit](https://github.com/catenasys/helm-charts/commit/0384ddbd0ce3bf08470b2661e77548f99994bf38)
* refactor(chart-yaml): bump chart version [view commit](https://github.com/catenasys/helm-charts/commit/ff5a33b1fcc8a06e598c1911cdf5cf01802684a2)
* fix(details): define versions as strings instead of ints [view commit](https://github.com/catenasys/helm-charts/commit/33c8035d90a4fd9befccee62410bdde989b59902)
* fix(sextant): correct data dir permissions for pgsql [view commit](https://github.com/catenasys/helm-charts/commit/9a6a57f6ea95464485ec24b3f59e21f95fc5787d)
* fix(sextant): set pgdata mount to /var/lib/postgresql/data [view commit](https://github.com/catenasys/helm-charts/commit/48f8e88e8e32e8afdee5d7330074920f22ed4194)

## v0.2.4

* fix(sextant): default serviceAccount.name in values.yaml to nil [view commit](https://github.com/catenasys/helm-charts/commit/82401e8d7e0dd2ead3f0ae21c67bfcc12b96a06b)

## v0.2.3

* fix(sextant-enterprise): update image and chart versions [view commit](https://github.com/catenasys/helm-charts/commit/ab1a50b40e1418aeb241d01039fdbe13260e5b95)
* fix(sawtooth): update image and chart versions [view commit](https://github.com/catenasys/helm-charts/commit/06cd0fe36c52905e17001b2c8cc037a876a6055f)
* fix(daml-on-sawtooth): update chart and image versions [view commit](https://github.com/catenasys/helm-charts/commit/9eb0493392ffd166bf9777ef754593b2066bdeea)
* fix(daml-on-qldb): update image and chart versions [view commit](https://github.com/catenasys/helm-charts/commit/d1ef569dfe15c9887655eedab8995e58db8fac55)
* fix(daml-on-postgres): update chart and image versions [view commit](https://github.com/catenasys/helm-charts/commit/60152b5daaf579587b1ecbdb6f7a440d34a4cccd)
* fix(daml-on-besu): update versions of chart and images [view commit](https://github.com/catenasys/helm-charts/commit/c6b75c98d6b953a6410b21ba147be13f06f7308a)

## v0.2.2

* fix(tfs-on-sawtooth): remove pbft.log on startup [view commit](https://github.com/catenasys/helm-charts/commit/f38a764c381dcae139bb246a4317a7c152a79ab5)
* fix(sextant-enterprise): point to licensed repository [view commit](https://github.com/catenasys/helm-charts/commit/bc01560869132894d6e117d879f85376b469c4ef)
* fix(sextant-sf): correct chart versions [view commit](https://github.com/catenasys/helm-charts/commit/c3d05e83caa683f22ce6893d3618a78f8e736b72)
* fix(sawtooth): remove pbft log before starting pbft-engine [view commit](https://github.com/catenasys/helm-charts/commit/6f632b03658b15d812a44ed7b353594a8e655040)

## v0.2.1

* fix(sextant-all): update child charts to use new sextant chart style [view commit](https://github.com/catenasys/helm-charts/commit/79eb93cb234ba3d399f6f8718beb635bcdacfe67)

## v0.2.0

* fix(sextant): correct references to old deployment style to statefulset style [view commit](https://github.com/catenasys/helm-charts/commit/4265e44b30fbf16eb2a207d90d173335aa39cfaa)
* fix(tfs): bump chart version [view commit](https://github.com/catenasys/helm-charts/commit/5ba196216da47fa9ca1b3e76ce051b6678ffac76)
* fix(tfs): use variable for integer consensus values in validator set [view commit](https://github.com/catenasys/helm-charts/commit/5d77fe70224985384bff4177bab696319d75563d)
* feat(charts): create tfs on sawtooth chart [view commit](https://github.com/catenasys/helm-charts/commit/a48a58c09f56896f6952c91eb69f9398438965c0)
* fix(daml): daml on etc deployment options look uniform in the UI [view commit](https://github.com/catenasys/helm-charts/commit/c3b74f0bb80124a5c0648a6a340943ceba5fd317)
* fix(daml-on-sawtooth): correct description and bump version [view commit](https://github.com/catenasys/helm-charts/commit/232bde4cf64e842f6de30e9475ff805bce66c9b0)
* fix(qldb): fix template variable names in service definition [view commit](https://github.com/catenasys/helm-charts/commit/9c717bf655642f12cacea10963e62301cdec5d0c)
* feat(charts): add daml on qldb chart [view commit](https://github.com/catenasys/helm-charts/commit/6abcfe6912f7eb3da1dbc1ee69ea0eadbaae6811)
* fix(sawtooth): bump chart version [view commit](https://github.com/catenasys/helm-charts/commit/69cff2cf2a504d5128f8810289a7ee3eef8251f7)
* refactor(sawtooth): rename template files [view commit](https://github.com/catenasys/helm-charts/commit/3ae3ede5bbdc56788f9e0d3c3a680a45bdf7d445)
* fix(sawtooth): remove monitoring set [view commit](https://github.com/catenasys/helm-charts/commit/debb4709d359b626dc4e4067e56899e2395e5a7f)
* fix(sawtooth): remove telegraf [view commit](https://github.com/catenasys/helm-charts/commit/913f146b425a82f90bf7b1b736c177cfd9405c86)
* fix(daml-on-postgres): change passwordOrSecret to use string values [view commit](https://github.com/catenasys/helm-charts/commit/f1255fe4ed72e5d8bee39fd72eb5f57d68ecfa99)
* fix(daml-on-postgres): adjust passwordOrSecret type to boolean [view commit](https://github.com/catenasys/helm-charts/commit/1d2f416558ce7fc20e56ecdd69094a336365cc48)
* fix(daml-on-postgres): adjust visibilityParameter values [view commit](https://github.com/catenasys/helm-charts/commit/5a0002656e46a89384ba5ddc4ec4583885379abb)
* fix(daml-on-sawtooth): use validator service and sawcomp for daml-rpc [view commit](https://github.com/catenasys/helm-charts/commit/150f75d0e42496dbb320fefed52f364999f756e5)
* fix(daml-on-sawtooth): fix postgres database url [view commit](https://github.com/catenasys/helm-charts/commit/e345c07fc2b4d4c6d2217f0c5b2fc3fbd2c65fb1)
* fix(daml-on-sawtooth): remove cm map for telegraf [view commit](https://github.com/catenasys/helm-charts/commit/97f2ecd4d13200f4b34175bd3f7d3cc2ca55cab5)
* feat(daml-on-sawtooth): use more recent version of daml-on-sawtooth [view commit](https://github.com/catenasys/helm-charts/commit/61bb3c2b5432c872d1eae8139102bdbf1aef5f5b)
* refactor(daml-on-sawtooth): rename template files, move serviceaccount out to separate file [view commit](https://github.com/catenasys/helm-charts/commit/5d88d02c0bf2bfecc30876f2fdb8664c5107106b)
* fix(daml-on-sawtooth): remove tracer-ui and leftover images in defaults [view commit](https://github.com/catenasys/helm-charts/commit/48c6c4986ddb85be0339c01f6b5527eca37dca04)
* fix(daml-on-sawtooth): remove xo and smallbank demo tps [view commit](https://github.com/catenasys/helm-charts/commit/ccee834ce33f8ce11ed24891bb667cf2530ac11f)
* fix(daml-on-sawtooth): remove seth from this chart [view commit](https://github.com/catenasys/helm-charts/commit/d307aefd83bd15b29984996d47aa4d33a876c4b3)
* fix(daml-on-sawtooth): remove monitoring components from this chart [view commit](https://github.com/catenasys/helm-charts/commit/c3694ff1cf75c6eea3569fd90c9cf3f48ce4eca9)
* fix(daml-on-sawtooth): allow setting of sawnet port all the way through [view commit](https://github.com/catenasys/helm-charts/commit/b0a1d3a1a08ff787b43b276f17e970110dc8eace)
* feat(charts): add postgresql-ha chart [view commit](https://github.com/catenasys/helm-charts/commit/def51ca1c00b2689a4e57af98a0730b8a163eef2)
* feat(charts): add influxdb chart [view commit](https://github.com/catenasys/helm-charts/commit/c3823e762be3860296052ef8e84fcfa2042313c6)
* feat(charts): add vault chart [view commit](https://github.com/catenasys/helm-charts/commit/e0cce6d3c66e30b01ec31420826351241cbbd53c)
* feat(charts): add grafana chart [view commit](https://github.com/catenasys/helm-charts/commit/a924cf5fb73b8a8184e647dd0bf225e84a2eefcd)
* fix(details): update deployment version to number value [view commit](https://github.com/catenasys/helm-charts/commit/8a98eac99bb3f2713b2c57c97b9e70bc7a6b4204)
* fix(nginx-ingress): correct dependency version [view commit](https://github.com/catenasys/helm-charts/commit/b6a01f48c7b1aba73576f4b16b2d9ce16ae944e0)
* fix(nginx-ingress): correct sextant/form.js [view commit](https://github.com/catenasys/helm-charts/commit/18e9ade71d43ca96173ae1a69126fef57e9db967)
* feat(charts): add nginx-ingress chart [view commit](https://github.com/catenasys/helm-charts/commit/11b5f10543dc3dfd0acf9f31eab80a88e9a49e16)
* fix(sextant): correct summary display [view commit](https://github.com/catenasys/helm-charts/commit/ae5e1a0c30dfe78de7d5d6a066ba1f5b0e24e9e0)
* refactor(charts): extract common fields [view commit](https://github.com/catenasys/helm-charts/commit/9ca4c3ab1082406c0df3aedf6a32c8900ef76688)
* feat(sextant): add sextant customization to sextant chart [view commit](https://github.com/catenasys/helm-charts/commit/58a331363a5efb814f7d19cc649b3289bb8f719b)
* fix(daml-on-postgres): allow zero length for password fields [view commit](https://github.com/catenasys/helm-charts/commit/cfbfefb6d5f050a192bc1cd93404244c9f80b7ed)
* refactor(besu): fix linting problems [view commit](https://github.com/catenasys/helm-charts/commit/1280c223ec02ac3244ab95ec6aae7cd6d8f86121)
* refactor(daml-on-besu): fix linting problems [view commit](https://github.com/catenasys/helm-charts/commit/87d5c8ecc0dd0f63ea86001ce6cd3c5867380b9b)
* refactor(elasticsearch): fix linting problems [view commit](https://github.com/catenasys/helm-charts/commit/199f8b874625c4ee3b2901166051eac088ce1f45)
* refactor(fluentd): fix linting problems [view commit](https://github.com/catenasys/helm-charts/commit/91833a9e009622a9e010a3462892b295e36f8856)
* refactor(kibana): fix linting problems [view commit](https://github.com/catenasys/helm-charts/commit/4a385017d8e91125c3efb2a39b34d6591e6b7e82)
* refactor(openebs): fix linting problems [view commit](https://github.com/catenasys/helm-charts/commit/ca6902ff7058dc2b9e8eeda50cd1f8dc81df4d75)
* refactor(sawtooth): fix linting problems [view commit](https://github.com/catenasys/helm-charts/commit/57ffd01e8419ac88fa9c33e443fee9926f60f742)
* refactor(daml-on-postgres): eslint corrections [view commit](https://github.com/catenasys/helm-charts/commit/1f6023586af529e5ff28e94bb71463d82cb25801)
* fix(daml-on-postgres): correct password validation [view commit](https://github.com/catenasys/helm-charts/commit/6aa1efeecb56e76baf959a774f8c23cede2d27d0)
* fix(daml-on-postgres): correct password validation [view commit](https://github.com/catenasys/helm-charts/commit/871d5ab792e2d01a5d56806bac42e5c3da2248a9)
* fix(daml-on-postgres): correct options [view commit](https://github.com/catenasys/helm-charts/commit/2839fc460ddb94d1c4696a8c56f4a98b61449961)
* fix(daml-on-postgres): expand postgres options [view commit](https://github.com/catenasys/helm-charts/commit/ad6b4688b6560f38c313d94a9ff4d7c986c6b09d)
* fix(daml-on-postgres): add persistence options to forms [view commit](https://github.com/catenasys/helm-charts/commit/389e790adc2177e13de6f24acb14109afdc54a3d)
* fix(daml-on-besu): add persistence options to form [view commit](https://github.com/catenasys/helm-charts/commit/7f9a3a773e46d683b21138bd3ccc1a6e674836c0)
* fix(besu): adjust dialog titles [view commit](https://github.com/catenasys/helm-charts/commit/1e688d05162991a34165bf2150ef73182fc0c516)
* fix(besu): add persistence options to form [view commit](https://github.com/catenasys/helm-charts/commit/0ace87fcf64421c7702c1d8df82eb8be02321582)
* fix(daml-on-postgres): correct daml-on-postgres entrypoint [view commit](https://github.com/catenasys/helm-charts/commit/03d9d8cc707eadc5b3d71d5f59c2ee8f17833d50)
* fix(daml-on-postgres): fix accessModes default parameter [view commit](https://github.com/catenasys/helm-charts/commit/ac5d3c06acdcea17ab2d62f4541dfb7e37da800d)
* fix(daml-on-postgres): remove dynamic port reference in summary [view commit](https://github.com/catenasys/helm-charts/commit/55edc32d1bff9f807b33d6d8d74c2058ad18597b)
* fix(daml-on-besu): correct besu.persistence.accessModes [view commit](https://github.com/catenasys/helm-charts/commit/44cc29ca37280acf34512d373056700104ed9afa)
* fix(daml-on-besu): distinguish rpc from besu statefulset [view commit](https://github.com/catenasys/helm-charts/commit/09fd370a37e14fef174e7869475b26032149965b)
* fix(daml-on-besu): resolve conflict between besu service and daml service [view commit](https://github.com/catenasys/helm-charts/commit/5a324a2b013252b989bfa9444b198dff4c16abe9)
* fix(besu): correct imagePullSecrets declarations [view commit](https://github.com/catenasys/helm-charts/commit/30a9582954c8845c3ec4fb387c637beb43998493)
* fix(daml-on-besu): update details to be daml-on-besu/1.3 [view commit](https://github.com/catenasys/helm-charts/commit/b72c8e645759250906049a47e4e84fc5a009615e)
* fix(sextant): correct existingPasswordSecret field [view commit](https://github.com/catenasys/helm-charts/commit/071fb4b4df6722c160660ee5b38c231816186461)
* feat(sextant): rework sextant chart to deploy a statefulset rather than use the operator [view commit](https://github.com/catenasys/helm-charts/commit/14c03d59019bdfa4f19bf48157480d13cee7e596)
* fix(daml-on-postgres): correct pgdata mount point [view commit](https://github.com/catenasys/helm-charts/commit/9b0c51255bbf460608dec3fdbb74d37ae3adc802)
* fix(daml-on-besu): bump chart version [view commit](https://github.com/catenasys/helm-charts/commit/92f9882450302d3c5d564f6f5f46f9bb7b2f9382)
* fix(daml-on-besu): correct mountpoint for pgdata on daml-on-besu [view commit](https://github.com/catenasys/helm-charts/commit/a32bc1cbdf46303f46b35182f3a7a21e10512d83)
* fix(daml-on-postgres): update form and summary details [view commit](https://github.com/catenasys/helm-charts/commit/3d8643d92284b8255fe9008cb3b1e52f90afb6b8)
* feat(daml-on-postgres): add daml-on-postgres chart [view commit](https://github.com/catenasys/helm-charts/commit/804a63287c1d0e3bc7dbe509d54b1087f19b5e94)
* fix(daml-on-besu): reorganize templates [view commit](https://github.com/catenasys/helm-charts/commit/1136259e795fda5da10ab13cb1d73d1f6a69b420)
* fix(daml-on-besu): change daml-on-besu to statefulset [view commit](https://github.com/catenasys/helm-charts/commit/6b1f3519a12d5b2c32a14b791d4100ea10f507af)
* fix(daml-on-besu): clean up dynamic storage provisioning [view commit](https://github.com/catenasys/helm-charts/commit/73113f70a5e8823d443617b31471488451946d9a)
* fix(besu): bump besu versions [view commit](https://github.com/catenasys/helm-charts/commit/de2e16e65dd7480927fbc7186f9ade4a75ba426e)
* fix(besu): update besu chart with sextant customizations and storage class customizations [view commit](https://github.com/catenasys/helm-charts/commit/5d17f8281e141eb1c5b92ff5094e806c59195351)
* fix(charts): add icons for fluentd and openebs [view commit](https://github.com/catenasys/helm-charts/commit/e65b7c387cde1d7a1e555c486f7d69f9ad4fd748)
* feat(kibana): add kibana chart with sextant customizations [view commit](https://github.com/catenasys/helm-charts/commit/27565e65ba31c27b2a3cd86db19d6d4b72224ee2)
* fix(gitignore): update gitignore [view commit](https://github.com/catenasys/helm-charts/commit/8c62926f37e61568a44d3a39cd68f48467ca1c68)
* feat(elasticsearch): add elasticsearch chart [view commit](https://github.com/catenasys/helm-charts/commit/8568b4d0899cd3d326a8564338b68d3c9781e991)
* fix(fluentd): reduce version resolution [view commit](https://github.com/catenasys/helm-charts/commit/aea3b6f09d1c74a2c0a966b2fdb8ceac16cf5b0d)
* feat(fluentd): add sextant customizations [view commit](https://github.com/catenasys/helm-charts/commit/bb2166f43ac7d4f45683a3320bbd10c08bdfa852)
* feat(fluentd): add base fluentd chart from bitnami [view commit](https://github.com/catenasys/helm-charts/commit/9e365b0ce448a932c5e26ec818568a8e31bf2508)
* fix(openebs): remove OWNERS and update Chart.yaml [view commit](https://github.com/catenasys/helm-charts/commit/3372abdecd1f9ecc52e251eb67b590cf836a877a)
* feat(openebs): add sextant customizations [view commit](https://github.com/catenasys/helm-charts/commit/8143fcb48757c142ec77b1eb26495dc74e12d928)
* feat(openebs): add imagePullSecrets to serviceAccount [view commit](https://github.com/catenasys/helm-charts/commit/6d8e46ffa8deefddb00f112632463998d2ce0b73)
* feat(openebs): add openebs base chart [view commit](https://github.com/catenasys/helm-charts/commit/9043005b22afe955ab62118129ba5a01c54fd7e9)
* fix(daml-on-besu): correct daml label [view commit](https://github.com/catenasys/helm-charts/commit/37cb8b1926f32b749173e9047768f8f0c2a2ab53)
* fix(daml-on-besu): fix daml label on rpc [view commit](https://github.com/catenasys/helm-charts/commit/14c90776803bb5f7ba938665b77d92d5b4a40bed)
* fix(daml-on-besu): fix deployment paths for name and namespace [view commit](https://github.com/catenasys/helm-charts/commit/531891fbcc41e1726406c929063215d40311ecf3)
* fix(daml-on-besu): remove orion-init-job added too soon [view commit](https://github.com/catenasys/helm-charts/commit/0c8d2d1519f29c09736e44c5752098a9e034a0fd)
* fix(daml-on-besu): fix namePath [view commit](https://github.com/catenasys/helm-charts/commit/57ceb508f8465c7be00f9b75f30611d54a22293f)
* fix(besu): correct besu chart name [view commit](https://github.com/catenasys/helm-charts/commit/ff84142a31a6313f324fd410bb49ba70d10c2fc7)
* fix(daml-on-besu): complete sextant integration [view commit](https://github.com/catenasys/helm-charts/commit/edd36de35d7b6904d604ed4603bb3853945e0313)
* feat(daml-on-besu): add basic daml-on-besu chart [view commit](https://github.com/catenasys/helm-charts/commit/1ad61be7df57ef0d9aef309562dec784efc90bf8)
* fix(besu): remove daml items [view commit](https://github.com/catenasys/helm-charts/commit/ae2cf3fc8f38b9cc07f0bcb253b9fc627bef8b0e)
* feat(besu): add basic besu chart [view commit](https://github.com/catenasys/helm-charts/commit/82748c9e74e01a05e7f66cd10d3e9e976db78b8b)
* fix(sawtooth): remove only sawtooth data on reset not keys [view commit](https://github.com/catenasys/helm-charts/commit/30968575505a5bab7877675460617e6a97681564)
* fix(isolation): change ISOLATION_ID to JOB_ID [view commit](https://github.com/catenasys/helm-charts/commit/0f1b46a2e4f0274cae885c19f0273e8cb0415e97)
* fix(helmigore): ignore package and package-lock [view commit](https://github.com/catenasys/helm-charts/commit/6907c9f740299be0cc62a9884dd0707775fca5a1)
* refactor(linting): configure npm and eslint lint and fix js code [view commit](https://github.com/catenasys/helm-charts/commit/11042927813840bb00081e753e0a639bd6abc971)
* style(configs): add helm lint to pre-commit [view commit](https://github.com/catenasys/helm-charts/commit/6c0d9acf3612fa8f5ef92105c153cf7c64274bb5)
* SXT-304 Bump chart version [view commit](https://github.com/catenasys/helm-charts/commit/6f69f5cb44712b416b2e51df7e50d1474f9cf5b7)
* SXT-305 Allow args and command fields to be left blank in deployment form [view commit](https://github.com/catenasys/helm-charts/commit/3d9b2a200369ebb6901edd84097cfeeb162187c7)
* Update charts/sawtooth/sextant/form.js [view commit](https://github.com/catenasys/helm-charts/commit/3469dbf2ddf356cdb83930dea72bb3ebf28791d2)
* SXT-305 Bump Chart version [view commit](https://github.com/catenasys/helm-charts/commit/96d4e00cb46270725a2c8813f1340b3633168286)
* SXT-305 Update language from 'custom tp' to custom container' [view commit](https://github.com/catenasys/helm-charts/commit/830a56689ea4239b0b7d71df67a1786cf239527a)
* GPG and Helm have unresolvable conflicts [view commit](https://github.com/catenasys/helm-charts/commit/8854ee1903fa121c2791d075abf5d097c4b55831)

## v0.1.7

* Add new line at EOL [view commit](https://github.com/catenasys/helm-charts/commit/05f587736d5e24b5ae87b2f08f0496da9a6af201)
* Add details.yaml to sextant directory [view commit](https://github.com/catenasys/helm-charts/commit/f2133e3241669fb25997eaef56c0b47649c91131)
* Remove deployment details from Chart.yaml [view commit](https://github.com/catenasys/helm-charts/commit/49365c308dec873308f98401c798cf09659ae05b)
* SEXTANT-COMPATABILITY Create sextant group in Chart.yaml [view commit](https://github.com/catenasys/helm-charts/commit/e47c21d21b4bb33875b3c471b54c36475256f1d9)
* SEXTANT_COMPATABILITY Fix typo and bump version in sawtooth 1.1 Chart.yaml [view commit](https://github.com/catenasys/helm-charts/commit/240cd8ff0f87c0d6af349630b4d4da48eb4eb1f1)
* UPdate version to 0.1.3 [view commit](https://github.com/catenasys/helm-charts/commit/492904acf0224ba7ad6f1964f69d749535cbd58e)
* change icon to buttonIcon [view commit](https://github.com/catenasys/helm-charts/commit/fcc572cb41f2361cc4b8eaa77ad91915e2a367ed)
* bump the minor version of the chart" [view commit](https://github.com/catenasys/helm-charts/commit/4674608e8ad88088d901cd55ea03b1027a0276fc)
* Add fields that correspond with index.js fields [view commit](https://github.com/catenasys/helm-charts/commit/36aab438e3f77f711962b8ec4e92a8bfd8e23fdc)
* Add sextant config files [view commit](https://github.com/catenasys/helm-charts/commit/ddcbd4d9103a31ca69fb2aa14264065eeb18e68d)
* Update template to include latest changes from kubetpl version [view commit](https://github.com/catenasys/helm-charts/commit/89f3fb017f1656cf8ca85566e0bd823bf2f90f62)
* Add initial sawtooth chart [view commit](https://github.com/catenasys/helm-charts/commit/f8732b77ee8d57874e36628bbcdbb68f650ee832)

## v0.1.6

* Update sextant enterprise to use BTP2.0.8-2.0.8 [view commit](https://github.com/catenasys/helm-charts/commit/fdeff422a5dde7865d00c41e582346df9c3f4a6a)

## v0.1.5

* Update AWS Marketplace container versions [view commit](https://github.com/catenasys/helm-charts/commit/ef3f8acf22578f3ebe6949b80847a236f562344a)
* Use sextant-ci rather sextant-test [view commit](https://github.com/catenasys/helm-charts/commit/5bf9333b4eaeae5ee632ebb141569ffb77333d2f)

## v0.1.4

* Update to BTP2.0.8 [view commit](https://github.com/catenasys/helm-charts/commit/59058111b58e38aba7ce4d2c0c93f2d43eeaab57)

## v0.1.3

* Update release versions [view commit](https://github.com/catenasys/helm-charts/commit/af7f398f8d7a4185b41b36939cde663684817e54)
* Correct service selector [view commit](https://github.com/catenasys/helm-charts/commit/cc32d0c8dae07ea36f448518bd01a12f83c70410)
* Wrong port again [view commit](https://github.com/catenasys/helm-charts/commit/ccd37fe4002b81ff65ddeb9161929215eb6d29e2)
* Point sextant-test to the unstable charts, and tick version [view commit](https://github.com/catenasys/helm-charts/commit/111b62736a4e17335216ef31659d31722042a11e)
* Tick the sextant chart version [view commit](https://github.com/catenasys/helm-charts/commit/5169da073616bf0bbfa22ccea559e632ba6ad02f)
* Sextant service was targeting the wrong container port [view commit](https://github.com/catenasys/helm-charts/commit/1336c1b486df3581f23b5a273c967272173d8514)
* Update .gitignore [view commit](https://github.com/catenasys/helm-charts/commit/412048609b1950e31656798a2bb30479c3098415)
* Update .gitignore [view commit](https://github.com/catenasys/helm-charts/commit/eb3b6ce49a7745811126c8239f467e28459d8372)

## v0.1.2

* correct build script [view commit](https://github.com/catenasys/helm-charts/commit/c6c07e652fa244fa0cd317b8c7ad4e490f5238c1)
* Charts should only depend on stable [view commit](https://github.com/catenasys/helm-charts/commit/10dfc97b23ec67ec3413a2b52f83143371514eb3)
* Fix working directory [view commit](https://github.com/catenasys/helm-charts/commit/8f1f6b34bde17029e63b9e3ddda68386c7872cde)
* Remove lingering index.yaml [view commit](https://github.com/catenasys/helm-charts/commit/49a39563ca5432b7f569799f298982265a04a710)
* Generate index [view commit](https://github.com/catenasys/helm-charts/commit/2ec029cc3fea451caa3e9466e74366a9e22ff69e)

## v0.1.1

* Added branch and tag detection to build [view commit](https://github.com/catenasys/helm-charts/commit/2b44ee1e97b524840f1360a72d6f9afe14a06557)

