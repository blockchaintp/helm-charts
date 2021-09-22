# TFS on Sawtooth

| field | description | default |
|-|-|-|
| `imagePullSecrets.enabled` | if true use the list of named imagePullSecrets | false |
| `imagePullSecrets.value` | a list if named secret references of the form   ```- name: secretName```| [] |
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
| `tp.args` | arguments to pass to the tp container | "-vv" |
| `tp.env` | environment variables to pass to the tp container | nil |
| `tp.image.pullPolicy` | imagePullPolicy for the tp | IfNotPresent |
| `tp.image.repository` | repository for the tp | taekion/taekion/taekion-fs-tp |
| `tp.image.tag` | tag of the tp container | "v0.6.0" |
| `maxUnavailable` | maxUnavailable for the deployment if kind=DaemonSet | 1 |
| `minReadySeconds` | minReadySeconds for the deployment (if deployment kind and k8s version supports it) | 120 |
| `middleware.args` | arguments to pass to the middleware container | "--debug" |
| `middleware.env` | environment variables for the middleware | nil |
| `middleware.image.pullPolicy` | imagePullPolicy for the middleware | IfNotPresent |
| `middleware.image.repository` | repository for the middleware | taekion/taekion-fs-middleware |
| `middleware.image.tag` | tag for the middleware | v0.6.0 |
| `middleware.port` | port for the middleware service| 8000 |
| `middleware.resources` | resources for the middleware | {} |
| `perNodeServiceType` | the type of service to create for per node access (only applies if kind=StatefulSet)| ClusterIP |
| `podAnnotations` | pod annotations for the tfs set | {} |
| `s3.args` | arguments to pass to the s3 container | "-vv" |
| `s3.enabled` | true to enable the s3 service | true |
| `s3.env` | environment variables for the s3 container | nil |
| `s3.image.pullPolicy` | imagePullPolicy for the s3 container | IfNotPresent |
| `s3.image.repository` | repository for the s3 container | taekion/taekion-fs-s3 |
| `s3.image.tag` | tag for the s3 container | v0.6.0 |
| `s3.port` | port for the s3 service| 9000 |
| `s3.resources` | resources for the s3 container | {} |
| `serviceAccount.create` | true to create a service account | false |
| `serviceAccount.name` | name of the service account | nil (defaults to based on release name) |
| `sawtooth` | sawtooth options may be configured | see [Sawtooth](../sawtooth/README.md) |
| `extraVolumes` | a list of additional volumes to add to all StatefulSets, Deployments, and DaemonSets | `[]` |
| `extraVolumeMounts` | a list of additional volume mounts to add to all StatefulSet, Deployment, and DaemonSet containers | `[]` |
