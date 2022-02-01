# AWS Enterprise Installation

Sextant is Kubernetes native. In other words, one installs Sextant into a
Kubernetes cluster.

## AWS Subscription

These instructions assume that you have successfully subscribed to the
[Sextant Enterprise Edition](https://aws.amazon.com/marketplace/pp/prodview-4uijahfv62uso).
on the AWS Marketplace.

## Tools

You will need the up to date versions of the following tools installed -

* [aws](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html)
* [eksctl](https://eksctl.io/introduction/#installation)
* [helm](https://helm.sh/docs/intro/install/)
* [kubectl](https://kubernetes.io/docs/tasks/tools/#kubectl)

## Create EKS Cluster

First create an Amazon EKS cluster by using the following command substituting
`<CLUSTER_NAME>` and `<REGION_NAME>` with a cluster name and region name of your
choice:

```bash
eksctl create cluster \
  --name <CLUSTER_NAME> \
  --region <REGION_NAME> \
  --node-type m5.large \
  --nodes 4 \
  --with-oidc \
  --managed
```

!!!Note
    By specifying 4 nodes this cluster can also be added to Sextant as
    a target cluster for Sawtooth or Besu deployments. However you are also
    free to use an existing EKS cluster.

## Create a Service Account

Sextant requires a service account with an
[IAM role](https://docs.aws.amazon.com/eks/latest/userguide/iam-roles-for-service-accounts.html)
to enable access to the appropriate Amazon Marketplace metering API. In this
instance the policy required is
[AWSMarketplaceMeteringRegisterUsage](https://docs.aws.amazon.com/marketplace/latest/userguide/security-iam-awsmanpol.html#security-iam-awsmanpol-awsmarketplacemeteringregisterusage).

### Step 1 (Optional)

If your Amazon EKS cluster has not been created with
[IAM OIDC provider](https://docs.aws.amazon.com/eks/latest/userguide/enable-iam-roles-for-service-accounts.html)
by, for example, using the `--with-oidc` option with `eksctl`, enable it with:

```bash
eksctl utils associate-iam-oidc-provider \
  --name <CLUSTER_NAME> \
  --region <REGION_NAME> \
  --approve
```

### Step 2: Create Namespace

Create namespace `sextant` for Sextant and switch to this -

```bash
kubectl create namespace sextant
kubectl config set-context --current --namespace=sextant
```

### Step 3: Create Service Account

Next we create a service account `sextant-aws-enterprise` using `eksctl` and
attach the policy using its Amazon Resource Name (ARN):

```bash
eksctl create iamserviceaccount \
--cluster=<CLUSTER_NAME> \
--region=<REGION_NAME> \
--namespace=sextant \
--name=sextant-aws-enterprise \
--attach-policy-arn="arn:aws:iam::aws:policy/AWSMarketplaceMeteringRegisterUsage" \
--override-existing-serviceaccounts \
--approve
```

!!!Note
    If you encounter an error creating (or updating) this service account then
    you need to delete it using `eksctl delete iamserviceaccount ...`:

## Install Sextant

### Step 1: Create values.yaml

Create a `values.yaml` file that tells `helm` to specify the service account
`sextant-aws-enterprise` that we have just created when deploying Sextant:

```yaml
edition: aws-enterprise
serviceAccount:
  create: false
  name: sextant-aws-enterprise
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
