# CHANGELOG

## Unreleased

* feat(daml-on-sawtooth): add persistence options for postgres

## v0.2.37

* fix: fix scoping in triggers

## v0.2.36

* feat(daml-on-sawtooth): add extraVolumeMounts across rpc pod
* fix: correct extra_args parsing for daml-rpc

## v0.2.35

* feat(sawtooth): resource configuration
* feat(daml-on-sawtooth): add individual daml-triggers SXT-566
* fix(daml-on-sawtooth): update documentation SXT-566
* fix(sawtooth): update sawtooth documentation SXT-566
* fix(sawtooth): remove .atomicwrite directories before validator startup SXT-588

## v0.2.34

* fix(daml-on-sawtooth): wait until all signals are received before starting
* refactor(tfs-on-sawtooth): resolve differences with other stl charts
* refactor(sawtooth): additional whitespace changes
* refactor(tfs-on-sawtooth): rename templates
* refactor(sawtooth): resolve differences between sawtooth and other stl charts
* fix(daml-on-sawtooth): resolve differences between d-o-s and other sawtooth charts
* fix(besu): set default besu image location to dockerhub SXT-549

## v0.2.33

* fix(daml-on-sawtooth): reduce failureThreshold and periodSeconds on signals based probes SXT-574

## v0.2.32

* fix(daml-on-sawtooth): make uniform container args and env paramets as well as imagePullPolicy

## v0.2.31

* fix(daml-on-sawtooth): correct entrypoints should be foreground
* fix(daml-on-sawtooth): missing mount names
* fix(daml-on-sawtooth): add new signals system
* feat(daml-on-sawtooth): make trigger service optional and default to false SXT-565
* fix(daml-on-postgres): fix typos in form
* fix(daml-on-postgres): bump chart versionn
* fix(daml-on-postgres): update helper text in form
* style(daml-on-qldb): bump chart subminor version
* fix(daml-on-qldb): disallow capital letters in ledger id
* fix(daml-on-postgres): bump chart version minor
* feat(daml-on-sawtooth): storage class form field is linked to 2 other fields
* fix(dalm-on-postgres): update form fields and options for postgres enabled

## v0.2.30

* fix: jsonapi arge to use a range and now be quoted

## v0.2.29

* fix(charts): correct environment var declarations

## v0.2.28

* fix(daml-on-besu): sdk v1.4 began defaulting the ledger id to a random, set instead to default-ledger-id
* fix(daml-on-besu): improvements to the d-o-b chart to improve resiliency SXT-518

## v0.2.27

* fix(sextant): correct label in NOTES.txt SXT-482

## v0.2.26

* fix: promote BTP2.1.0rc14 SXT-511

## v0.2.25

* fix(daml): correct secret volume mount name SXT-511
* fix(daml): correct secret name SXT-511
* build(pre-commit): update pre-commit SXT-511
* fix(sextant): correct NOTES.txt for pod selection
* fix(daml-on-qldb): disable daml ui features for the time being until daml-sdk for qldb is updated
* fix(daml-on-besu): remove constant --logging arg
* fix(daml): add auth method arguments and correct extra_args template SXT-511
* fix(daml): specify values.yaml default for auth SXT-511
* fix(daml): mount jwt-secret SXT-511
* fix(daml-jwt): add the secret roles to the other flavours of DAML deployment
* fix(daml-jwt): include secrets in role so we can create a jwt secret in the startup job
* fix(daml-jwt): containers run in parallel so wait for file to appear before proceeding
* fix(daml-jwt): fix typo in daml jwt job
* feat: add rsa certificate generation to daml charts
* build: add Makefile
* refactor: move docker tool to subdir and rework
* build(pre-commit): correct exclusion declarations
* refactor: correct helm lint issues in all charts

## v0.2.24

* fix(daml-on-sawtooth): remove probe data files on restart of validator

## v0.2.23

* fix(daml-on-sawtooth): correct lifecycle declaration
* fix(daml-on-sawtooth): move exit signals to preStop lifecycle

## v0.2.22

* fix(daml-on-sawtooth): fix command line
* fix(daml-on-sawtooth): correct syntax error in validator script section
* fix(daml-on-sawtooth): add exit for signals to validator container

## v0.2.21

* fix(daml-on-sawtooth): correct signals directory as a mitigation until liveness probe is corrected
* fix(daml-on-sawtooth): correct SIGNALS_DIR
* fix(daml-on-sawtooth): add signals volume
* fix(daml-on-sawtooth): correct kill command
* fix(daml-on-sawtooth): add pbft-engine signal support and use by default

## v0.2.20

* fix(sextant-details): fix punctuation errors
* fix(form): fix typo in image pull secret helper text
* fix(details): update the displayed logo
* fix(forms): display deployment type in form header
* fix(forms): remove affinity option from non-sawtooth forms
* fix(forms): make deployment name subtext uniform
* fix(tfs-details): update description and sawtooth version
* fix(sawtooth-details): update display name and description
* fix(besu-details): update deisplay name and description
* feat(details-yaml): update logo image name for new tfs logo
* refactor(chart-yaml): bump chart version

## v0.2.19

* fix(daml-on-sawtooth): add trigger service port to daml-rp service

## v0.2.18

* fix(daml-on-sawtooth): correct trigger ingress name

## v0.2.17

* fix(daml-on-sawtooth): add jsonapi args

## v0.2.16

* fix(daml-on-sawtooth): correct trigger http port default

## v0.2.15

* fix(daml-on-sawtooth): add initContainer to change extraMounts permissions
* fix(daml-on-sawtooth): add extraVolumeMounts capability
* fix(daml-on-sawtooth): set to rc11
* fix(daml-on-sawtooth): add daml-trigger-service

## v0.2.14

* fix(daml-on-sawtooth): correct daml-tp env indentation
* fix(daml-on-sawtooth): remove cpu limit on daml-tp and enable env parsing
* fix(daml-on-sawtooth): increase cpu limit for daml-tp

## v0.2.13

* fix(daml-on-sawtooth): remove genesis files on reseed
* fix(daml-on-sawtooth): source the genesis scripts
* fix(daml-on-sawtooth): quote environment vals
* fix(daml-on-sawtooth): correct typo
* fix(daml-on-sawtooth): add configurables for max-ops-per-batch and max-batches-outstanding
* add args to various containers
* fix(daml-on-sawtooth): remove default logging args
* fix(daml-on-sawtooth): add args to various containers
* fix(daml-on-besu): add extra_args to daml-on-besu rpc
* fix(forms): use deployment name instead of network name

## v0.2.12

* fix(sawtooth): and daml-on-sawtooth remove /etc/sawtooth/initialized on reseed

## v0.2.11

* fix(daml-on-besu): fix typo in private besu startup

## v0.2.10

* fix(daml-on-besu): fix typo in values

## v0.2.9

* fix(daml-on-besu): fix typo in genesis cm

## v0.2.8

* fix(daml-on-besu): allocate DAML precompile accounts in genesis
* fix(daml-on-besu): fix typo in besu.privateImage
* fix(daml-on-besu): fix typo
* fix(daml-on-besu): add daml private options
* fix(postgres): update PGDATA directories to use a subdir
* fix(daml-on-besu): change PGDATA to a subdir
* fix(daml-on-besu): change postgres data directory
* fix(pipeline): correct unstable publishing
* fix(postgres): add PGDATA vars to postgres initialization to prevent wipeouts
* fix(pipeline): correct unstable publishing
* fix(pipeline): always publish to unstable on the master branch

## v0.2.7

* fix(daml-on-besu): change default besu datapath and reference

## v0.2.6

* fix(sawtooth): update external seeds hostname field regex
* fix(daml-on-sawtooth): update external seeds hostname field regex
* fix(form): persistence enabled form fields not null or visible by default
* refactor(chart): bump chart version

## v0.2.5

* fix(daml-on-postgres): correct daml-rpc service name
* fix(daml-on-postgres): correct daml-service declaration
* fix(daml-on-postgress): add ingress for jsonapi
* fix(daml-on-sawtooth): add ingress for jsonapi
* fix(daml-on-sawtooth): correct env quoting
* fix(daml-on-postgres): correct environment quoting
* fix(daml-on-postgres): add json-api to daml-on-postgres
* fix(daml-on-sawtooth): correct env declaration for jsonapi
* fix(daml-on-sawtooth): updates to use jsonapi
* refactor(chart-yaml): bump chart version
* fix(details): define versions as strings instead of ints
* fix(sextant): correct data dir permissions for pgsql
* fix(sextant): set pgdata mount to /var/lib/postgresql/data

## v0.2.4

* fix(sextant): default serviceAccount.name in values.yaml to nil

## v0.2.3

* fix(sextant-enterprise): update image and chart versions
* fix(sawtooth): update image and chart versions
* fix(daml-on-sawtooth): update chart and image versions
* fix(daml-on-qldb): update image and chart versions
* fix(daml-on-postgres): update chart and image versions
* fix(daml-on-besu): update versions of chart and images

## v0.2.2

* fix(tfs-on-sawtooth): remove pbft.log on startup
* fix(sextant-enterprise): point to licensed repository
* fix(sextant-sf): correct chart versions
* fix(sawtooth): remove pbft log before starting pbft-engine

## v0.2.1

* fix(sextant-all): update child charts to use new sextant chart style

## v0.2.0

* fix(sextant): correct references to old deployment style to statefulset style
* fix(tfs): bump chart version
* fix(tfs): use variable for integer consensus values in validator set
* feat(charts): create tfs on sawtooth chart
* fix(daml): daml on etc deployment options look uniform in the UI
* fix(daml-on-sawtooth): correct description and bump version
* fix(qldb): fix template variable names in service definition
* feat(charts): add daml on qldb chart
* fix(sawtooth): bump chart version
* refactor(sawtooth): rename template files
* fix(sawtooth): remove monitoring set
* fix(sawtooth): remove telegraf
* fix(daml-on-postgres): change passwordOrSecret to use string values
* fix(daml-on-postgres): adjust passwordOrSecret type to boolean
* fix(daml-on-postgres): adjust visibilityParameter values
* fix(daml-on-sawtooth): use validator service and sawcomp for daml-rpc
* fix(daml-on-sawtooth): fix postgres database url
* fix(daml-on-sawtooth): remove cm map for telegraf
* feat(daml-on-sawtooth): use more recent version of daml-on-sawtooth
* refactor(daml-on-sawtooth): rename template files, move serviceaccount out to separate file
* fix(daml-on-sawtooth): remove tracer-ui and leftover images in defaults
* fix(daml-on-sawtooth): remove xo and smallbank demo tps
* fix(daml-on-sawtooth): remove seth from this chart
* fix(daml-on-sawtooth): remove monitoring components from this chart
* fix(daml-on-sawtooth): allow setting of sawnet port all the way through
* feat(charts): add postgresql-ha chart
* feat(charts): add influxdb chart
* feat(charts): add vault chart
* feat(charts): add grafana chart
* fix(details): update deployment version to number value
* fix(nginx-ingress): correct dependency version
* fix(nginx-ingress): correct sextant/form.js
* feat(charts): add nginx-ingress chart
* fix(sextant): correct summary display
* refactor(charts): extract common fields
* feat(sextant): add sextant customization to sextant chart
* fix(daml-on-postgres): allow zero length for password fields
* refactor(besu): fix linting problems
* refactor(daml-on-besu): fix linting problems
* refactor(elasticsearch): fix linting problems
* refactor(fluentd): fix linting problems
* refactor(kibana): fix linting problems
* refactor(openebs): fix linting problems
* refactor(sawtooth): fix linting problems
* refactor(daml-on-postgres): eslint corrections
* fix(daml-on-postgres): correct password validation
* fix(daml-on-postgres): correct options
* fix(daml-on-postgres): expand postgres options
* fix(daml-on-postgres): add persistence options to forms
* fix(daml-on-besu): add persistence options to form
* fix(besu): adjust dialog titles
* fix(besu): add persistence options to form
* fix(daml-on-postgres): correct daml-on-postgres entrypoint
* fix(daml-on-postgres): fix accessModes default parameter
* fix(daml-on-postgres): remove dynamic port reference in summary
* fix(daml-on-besu): correct besu.persistence.accessModes
* fix(daml-on-besu): distinguish rpc from besu statefulset
* fix(daml-on-besu): resolve conflict between besu service and daml service
* fix(besu): correct imagePullSecrets declarations
* fix(daml-on-besu): update details to be daml-on-besu/1.3
* fix(sextant): correct existingPasswordSecret field
* feat(sextant): rework sextant chart to deploy a statefulset rather than use the operator
* fix(daml-on-postgres): correct pgdata mount point
* fix(daml-on-besu): bump chart version
* fix(daml-on-besu): correct mountpoint for pgdata on daml-on-besu
* fix(daml-on-postgres): update form and summary details
* feat(daml-on-postgres): add daml-on-postgres chart
* fix(daml-on-besu): reorganize templates
* fix(daml-on-besu): change daml-on-besu to statefulset
* fix(daml-on-besu): clean up dynamic storage provisioning
* fix(besu): bump besu versions
* fix(besu): update besu chart with sextant customizations and storage class customizations
* fix(charts): add icons for fluentd and openebs
* feat(kibana): add kibana chart with sextant customizations
* fix(gitignore): update gitignore
* feat(elasticsearch): add elasticsearch chart
* fix(fluentd): reduce version resolution
* feat(fluentd): add sextant customizations
* feat(fluentd): add base fluentd chart from bitnami
* fix(openebs): remove OWNERS and update Chart.yaml
* feat(openebs): add sextant customizations
* feat(openebs): add imagePullSecrets to serviceAccount
* feat(openebs): add openebs base chart
* fix(daml-on-besu): correct daml label
* fix(daml-on-besu): fix daml label on rpc
* fix(daml-on-besu): fix deployment paths for name and namespace
* fix(daml-on-besu): remove orion-init-job added too soon
* fix(daml-on-besu): fix namePath
* fix(besu): correct besu chart name
* fix(daml-on-besu): complete sextant integration
* feat(daml-on-besu): add basic daml-on-besu chart
* fix(besu): remove daml items
* feat(besu): add basic besu chart
* fix(sawtooth): remove only sawtooth data on reset not keys
* fix(isolation): change ISOLATION_ID to JOB_ID
* fix(helmigore): ignore package and package-lock
* refactor(linting): configure npm and eslint lint and fix js code
* style(configs): add helm lint to pre-commit
* SXT-304 Bump chart version
* SXT-305 Allow args and command fields to be left blank in deployment form
* Update charts/sawtooth/sextant/form.js
* SXT-305 Bump Chart version
* SXT-305 Update language from 'custom tp' to custom container'
* GPG and Helm have unresolvable conflicts

## v0.1.7

* Add new line at EOL
* Add details.yaml to sextant directory
* Remove deployment details from Chart.yaml
* SEXTANT-COMPATABILITY Create sextant group in Chart.yaml
* SEXTANT_COMPATABILITY Fix typo and bump version in sawtooth 1.1 Chart.yaml
* UPdate version to 0.1.3
* change icon to buttonIcon
* bump the minor version of the chart"
* Add fields that correspond with index.js fields
* Add sextant config files
* Update template to include latest changes from kubetpl version
* Add initial sawtooth chart

## v0.1.6

* Update sextant enterprise to use BTP2.0.8-2.0.8

## v0.1.5

* Update AWS Marketplace container versions
* Use sextant-ci rather sextant-test

## v0.1.4

* Update to BTP2.0.8

## v0.1.3

* Update release versions
* Correct service selector
* Wrong port again
* Point sextant-test to the unstable charts, and tick version
* Tick the sextant chart version
* Sextant service was targeting the wrong container port
* Update .gitignore

## v0.1.2

* correct build script
* Charts should only depend on stable
* Fix working directory
* Remove lingering index.yaml
* Generate index

## v0.1.1

* Added branch and tag detection to build

