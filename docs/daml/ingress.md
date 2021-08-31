# JSON-API

This pages describes various notes and useful information about the JSON-API.

## Ingress and CORS

Access to the JSON-API in these deployments is normally provided via an
Ingress object (See individual deployment type for details on how to enable
this). CORS settings for Ingresses are handled differently depending on the
specific Ingress Controller that is in use.  A complete documentation of how
to setup CORS for every controller is beyond the scope of this document.
However, for illustration purposes we can note the settings one would use for
Ingresses under the NGINX Ingress Controller.

NGINX Ingress settings for CORS are enabled via annotations on the Ingress
object.  For a full discussion see
[Enable CORS](https://kubernetes.github.io/ingress-nginx/user-guide/nginx-configuration/annotations/#enable-cors)
in the NGINX Ingress documentation.  In brief the following annotations are
required:

```yaml
nginx.ingress.kubernetes.io/enable-cors: "true"
# NOTE: this is an insecure setting, origins should be restricted to an
# appropriate value.
nginx.ingress.kubernetes.io/cors-allow-origin: "*"
```

For [Daml on Postgres](../daml-on-postgres/README.md) those annotations would be
provided via the following YAML.  The added configuration may be found between BEGIN
and END, but is placed in context of an example configuration.

```yaml
daml:
  jsonapi:
    ingress:
      enabled: true
      annotations:
        # BEGIN CORS annotations
        nginx.ingress.kubernetes.io/enable-cors: "true"
        # NOTE: this is an insecure setting, origins should be restricted to an
        # appropriate value.
        nginx.ingress.kubernetes.io/cors-allow-origin: "*"
        # END CORS annotations
      hosts:
        - host: myhost.local
          paths:
            - /
```
