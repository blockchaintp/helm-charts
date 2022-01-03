# Accessing Sextant

!!!Note
    These instructions assume that you installed Sextant using default name
    `sextant`. If you chose another name such as `test` then substitute
    `test-sextant-0` for `sextant-0` in the instructions below.

## Option 1 - Port Forwarding

You can use port forwarding using this command:

```bash
kubectl port-forward sextant-0 8080:80
```

Connect to Sextant by pointing a browser at <http://localhost:8080>

## Option 2 - Using Load Balancer

If you want a persistent connection to your _Sextant_ instance, you
will need to create a load balancer.

```bash
kubectl expose pod/sextant-0 --type=LoadBalancer \
  --name=sextant-0-lb --port=80 --target-port=80
```

__Note:__ While this is acceptable in the short term, we recommend setting up
a k8s ingress controller for long-term access.

To obtain the external IP of the LoadBalancer you just created, use the
following command

```bash
kubectl get all -o wide | grep LoadBalancer | awk '{print $4}'
```

Which will return the external IP address of the load balancer, e.g.,
`192.168.192.1`. You may now use this address to access _Sextant_, e.g.,
<http://192.168.192.1>

## Option 3 - Using Ingress Controller

If you have an ingress controller installed into your cluster, _Sextant_ may be
configured to use it, by specifying configuration in your `values.yaml` similar
to the following:

```yaml
ingress:
  enabled: true
  hostname: sextant.example.com
  annotations: {}
```

There are several other options available for configuring _Sextant_ to use an
ingress which are detailed [here](README.md)
