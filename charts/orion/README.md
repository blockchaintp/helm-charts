# Helm Chart

Orion helm chart.

## Configuration

| field | description | default |
|- |- |- |
| imagePullSecrets.enabled | true if imagePullSecrets will be provided | false |
| imagePullSecrets.value | a list of names of imagePullSecrets | [] |
| global.image.registry | global override of the image registry | index.docker.io |
| global.postgresql.servicePort | global override of the postgresql service port | 5432 |
| `ingress.apiVersion` | if necessary the apiVersion of the ingress may be overridden | "" |
| `ingress.enabled` | true to enable the ingress to the main service rest-api | false |
| `ingress.certManager` | true to enable the acme certmanager for this ingress | false |
| `ingress.hostname` | primary hostname for the ingress | false |
| `ingress.path` | path for the ingress's primary hostname | / |
| `ingress.pathType` | pathType for the ingress's primary hostname | nil |
| `ingress.annotations` | annotations for the ingress | {} |
| `ingress.tls` | true to enable tls on the ingress with a secrete at hostname-tls | false |
| `ingress.extraHosts` | list of extra hosts to add to the ingress | [] |
| `ingress.extraPaths` | list of extra paths to add to the primary host of the ingress | [] |
| `ingress.extraTls` | list of extra tls entries | [] |
| orion.affinity | a yaml block defining the affinity rules for the statefulset | {} |
| orion.annotations | a yaml block defining the annotations for the statefulset | {} |
| orion.clientport | the port on which the orion servers will listen | 8888 |
| orion.clientnetworkinterface | the network interface on which the orion servers will listen | "0.0.0.0" |
| orion.image.pullPolicy | the image pull policy | IfNotPresent |
| orion.image.repository | the image repository | consensys/quorum-orion |
| orion.image.tag | the image tag | "21.1.1" |
| orion.storage | the storage configuration (memory, leveldb or postgres) | "postgres"
| orion.nodeport | the port on which orion servers will communicate with each other | 8080 |
| orion.nodenetworkinterface | the network interface on which orion servers will communicate with each other | "0.0.0.0" |
| orion.other nodes | a list of node urls outside this deployment which these orion nodes will connect to | [] |
| orion.replicas | the number of replicas for the orion statefulset | 2 |
| orion.resources | a yaml block defining the resources for the statefulset | {} |
| serviceAccount.create | true if the service account will be created | false |
| serviceAccount.name | overrides the name of the service account | nil |
| utils.k8s.image.pullPolicy | the k8s image pull policy | IfNotPresent |
| utils.k8s.image.repository | the k8s image repository | alpine/k8s |
| utils.k8s.image.tag | the k8s image tag | 3.11 |
| postgresql.create | true if an embedded postgresql will be created. if false external database credentials will need to be provided | true |
| postgresql.postgresqlDatabase | name of the postgres database to use | "orion" |
| postgresql.postgresqlUsername | name of the postgres user to use | "orion" |
| postgresql.host | the hostname of the postgresql server | nil |
| postgresql.existingSecret | the name of an existing secret containing the postgresql credentials | nil |
| postgresql.postgresqlPassword | the password of the postgresql user | nil |
| postgresql.servicePort | the port of the postgresql server | 5432 |
| postgresql.replicationPassword | the password of the postgresql replication user | nil |
| postgresql.initdbScripts | a map of initdb scripts to run on the postgresql server |  |
| `extraVolumes` | a list of additional volumes to add to all StatefulSets, Deployments, and DaemonSets | `[]` |
| `extraVolumeMounts` | a list of additional volume mounts to add to all StatefulSet, Deployment, and DaemonSet containers | `[]` |
