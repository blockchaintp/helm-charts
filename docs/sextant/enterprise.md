# Enterprise Installation

Sextant is Kubernetes native. In other words, one installs Sextant into a
Kubernetes cluster.

## License

Use of Sextant is governed by a Subscription Agreement or an
Evaluation Agreement. If you aren't a subscriber then you can sign up for an
evaluation [here](https://www.blockchaintp.com/sextant/evaluation).

## Tools

You will need the up to date versions of the following tools installed -

* [aws](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html)
* [eksctl](https://eksctl.io/introduction/#installation)
* [helm](https://helm.sh/docs/intro/install/)
* [kubectl](https://kubernetes.io/docs/tasks/tools/#kubectl)

!!!Note
    These instructions focus on Amazon EKS and use the official EKS CLI `eksctl`
    but Sextant can be deployed just as easily on a Kubernetes cluster on-prem
    or provisioned in Azure, GCP or a specialist cloud provider such as
    [Equinix Metal](https://docs.blockchaintp.com/projects/cookbooks/en/latest/equinix/).

## Create Cluster

If you have an existing four-node cluster, you can use this. Otherwise, create
an Amazon EKS cluster by using the following command substituting
`<CLUSTER_NAME>` and `<REGION>`:

```bash
eksctl create cluster \
  --name <CLUSTER_NAME> \
  --region <REGION_NAME> \
  --node-type m5.large \
  --nodes 4 \
  --with-iodc \
  --managed
```

!!!Note
    By specifying 4 nodes this cluster can also be added to Sextant as
    a target cluster for Sawtooth or Besu deployments.

Alternatively, use AKS, GKE, or similar.

## Prepare Cluster

### Step 1: Create Namespace

Create namespace sextant for Sextant and switch to this -

```bash
kubectl create namespace sextant
kubectl config set-context --current --namespace=sextant
```

### Step 2: Create Kubernetes image pull secret

To install Sextant, you will need to access BTP's official docker image
registry.

Once you have acquired the credentials for this registry from BTP
you can create the image pull secret `btp-lic` for the Sextant
helm chart to use upon install.

```bash
kubectl create secret docker-registry btp-lic \
--docker-server=https://dev.catenasys.com:8084/ --docker-username=<your-name> \
--docker-password='<your-password>' --docker-email=<your-email>
```

For more information on this command, see [here](https://kubernetes.io/docs/tasks/configure-pod-container/pull-image-private-registry/#create-a-secret-by-providing-credentials-on-the-command-line).

## Install Sextant

### Step 1: Create values.yaml

Assuming you have created the docker registry secret `btp-lic` as above, next
you need to create a `values.yaml` file enabling image pull secrets and
specifying this secret:

```yaml
edition: enterprise
imagePullSecrets:
  enabled: true
  value:
    - name: btp-lic
postgres:
  persistence:
    enabled: true
```

!!!Note
    By enabling persistence in the example above you will ensure that
    state is preserved even if you restart or delete/reinstall Sextant
    with the same name in the same namespace.

### Step 2: Add or Update BTP Helm Charts Repo

Add the BTP helm charts repo:

```bash
helm repo add btp-stable https://btp-charts-stable.s3.amazonaws.com/charts/
```

Note that if you have done this previously you should make sure you have the
most uptodate BTP helm charts repo using this command:

```bash
helm repo update
```

### Step 3: Deploy Sextant

Then run this `helm` command to install Sextant:

```bash
helm install -f values.yaml sextant btp-stable/sextant
```

The output should look something like this:

```text
NAME: sextant
LAST DEPLOYED: Mon Jan  3 14:32:33 2022
NAMESPACE: sextant
STATUS: deployed
REVISION: 1
TEST SUITE: None
NOTES:
1. Get the initial Sextant application username and password by running this command
  kubectl describe pod/sextant-0 --namespace sextant-aws | grep INITIAL_

2. Get the application URL by running these commands:
  export POD_NAME=$(kubectl get pods -l "app.kubernetes.io/name=sextant" -o jsonpath="{.items[0].metadata.name}")
  echo "Visit http://127.0.0.1:8080 to use your application"
  kubectl port-forward $POD_NAME 8080:80
```

## Save Admin Credentials

Obtain the initial Sextant application username and password by running this
command:

```bash
kubectl describe pod/sextant-0|grep INITIAL_
```

Make a note of the username and password for admin access to Sextant. You will
need these to log into Sextant.

!!!Note
   These details will persist even if you restart or delete/reinstall Sextant
   with the same name in the same namespace since we enabled postgres
   persistence.

## Setup Access to Sextant

Follow these [instructions](access.md) to set up access to Sextant either via
`portforward` or a more permanent solution.

## Login to Sextant

Once you have done this you can login using your saved username and password
and start using Sextant. Instructions on how to do this can be found in the
[Sextant User Guide](https://docs.blockchaintp.com/en/latest/sextant/overview/).
