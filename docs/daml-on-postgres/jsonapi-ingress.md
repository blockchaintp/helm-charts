# Exposing the DAML JSON API

## Prerequistes

You will need an [ingress controller](/services#ingress-controller) running on
your cluster.
In this example we'll use the kubernetes default nginx ingress controller.
You can find installation and configuration instructions for your
environment [here](https://kubernetes.github.io/ingress-nginx/deploy/).

## Configuring the ingress

Next you'll need to add some custom yaml to your daml-on-postgres deployment.
This will enable the Daml JSON API ingress and allow you to configure
the ingress.

The basic fields needed are as these:

```yaml
daml:
  jsonapi:
    ingress:
      enabled: true
      hostname: example.com
      path: /api
      pathType: Prefix
      annotations:
        kubernetes.io/ingress.class: "nginx"
```

This example will configure the ingress so that the api will be available
at `example.com/api`
You will needs to edit this example for your use case, at a minimum
the `hostname` and `path`

Note:
If you are using AWS the default nginx ingress controller will have a FQDN.
You can use this as the hostname for your ingress to avoid having to configure
DNS during testing.

## Advanced configuration

You can find the full list of values available to configure the JSON API
ingress [here](../).
