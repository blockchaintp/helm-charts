# Installation

_Sextant | Enterprise_ is Kubernetes native. In other words, one installs
_Sextant | Enterprise_ into a Kubernetes cluster.

## License

Use of _Sextant | Enterprise_ is governed by a Subscription Agreement or an
Evaluation Agreement. If you aren't a subscriber then you can sign up for an
evaluation [here](https://www.blockchaintp.com/sextant/evaluation).

## Tools

You will need the up to date versions of the following tools installed -

* [kubectl](https://kubernetes.io/docs/tasks/tools/#kubectl)
* [eksctl](https://eksctl.io/introduction/#installation)
* [helm](https://helm.sh/docs/intro/install/)

In addition, if you are working with one of the cloud providers, you will need
their CLI tools.

## Create Cluster

If you have an existing four-node cluster, you can use this. Otherwise, create
an AWS EKS cluster by using the following command:

```bash
##
# Where:
#   CLUSTER_NAME is the name you choose for your cluster
#   REGION is the AWS region in which to create the cluster
eksctl create cluster \
  --name <CLUSTER_NAME> \
  --region <REGION_NAME> \
  --node-type m5.large \
  --nodes 4
```

Alternatively, use AKS, GKE, or similar.

## Prepare Cluster

### Step 1: BTP Helm Charts

First, add the BTP helm repositories:

```bash
helm repo add btp-stable https://btp-charts-stable.s3.amazonaws.com/charts/
```

### Step 2: Create Namespace

Create namespace sextant for _Sextant | Enterprise_ and switch to this -

```bash
kubectl create namespace sextant
kubectl config set-context --current --namespace=sextant
```

### Step 3: Create Kubernetes secrets

To install _Sextant | Enterprise_, you will need to access BTP's official docker
image registry.  Once you have acquired the registry credentials you can create
an "image pull secret" for the _Sextant | Enterprise_ helm chart to use upon
install.  For instructions on how to create a docker registry secret for you
cluster, see
[here](https://docs.aws.amazon.com/eks/latest/userguide/create-cluster-secrets.html#create-cluster-secrets-imagepullsecret).

Assuming you have created a docker registry secret named `btp-lic`, you next
need to create a `values.yaml` specifying the registry secret.  For example:

```yaml
sextant:
  imagePullSecrets:
    enabled: true
    value:
    - btp-lic
  postgres:
    persistence:
      enabled: true
```

__Note:__ by enabling persistence in the example above you will ensure that
state is preserved even if you restart or delete/reinstall
_Sextant | Enterprise_.

## Install _Sextant | Enterprise_

```bash
helm install -f values.yaml sextant btp-stable/sextant-enterprise
```

The output should look something like this:

```text
NAME: sextant
LAST DEPLOYED: Mon Aug 23 00:51:36 2021
NAMESPACE: sextant
STATUS: deployed
REVISION: 1
TEST SUITE: None
NOTES:
1. Get the initial Sextant application username and password by running this command
  kubectl describe pod/sextant-sextant-enterprise-0|grep INITIAL_

2. Get the application URL by running these commands:
  export POD_NAME=$(kubectl get pods -l "app=sextant-enterprise" -o jsonpath="{.items[0].metadata.name}")
  echo "Visit http://127.0.0.1:8080 to use your application"
  kubectl port-forward $POD_NAME 8080:80
```

## Save Admin Credentials

To obtain the initial password for the admin user, run this command:

```bash
kubectl describe pod/sextant-sextant-enterprise-0|grep INITIAL_
```

Make a note of the username and password for admin access to
_Sextant | Enterprise_. You will need these to log into _Sextant | Enterprise_.
__Note:__ these details will persist even if you restart or delete/reinstall
_Sextant | Enterprise_.

## Accessing _Sextant | Enterprise_

### Option 1 - Port Forwarding

You can use port forwarding using this command:

```bash
kubectl port-forward sextant-sextant-enterprise-0 8080:80
```

Connect to _Sextant | Enterprise_ by pointing a browser at
<http://localhost:8080>

### Option 2 - Using Load Balancer

If you want a persistent connection to your _Sextant | Enterprise_ instance, you
will need to create a load balancer.

```bash
kubectl expose pod/sextant-sextant-enterprise-0 --type=LoadBalancer \
  --name=sextant-sextant-enterprise-0-lb --port=80 --target-port=80
```

__Note:__ While this is acceptable for this evaluation, we recommend setting up
a k8s ingress controller for long-term access.

To obtain the external IP of the LoadBalancer you just created, use the
following command

```bash
kubectl get all -o wide | grep LoadBalancer | awk '{print $4}'
```

Which will return the external IP address of the load balancer, e.g.,
`192.168.192.1`. You may now use this address to access _Sextant | Enterprise_,
e.g., <http://192.168.192.1>

### Option 3 - Using Ingress Controller

If you have an ingress controller installed into your cluster,
_Sextant | Enterprise_ may be configured to use it, by specifying configuration
in your `values.yaml` similar to the following:

```yaml
sextant:
  ingress:
    enabled: true
    hostname: sextant.example.com
    annotations: {}
```

There are several other options available for configuring
_Sextant | Enterprise_ to use an ingress which are detailed [here](README.md)
