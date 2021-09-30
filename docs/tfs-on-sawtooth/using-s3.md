# TFS S3 API

  TFS can provide an S3 endpoint for interacting with its volumes and files.
In the context of S3, a TFS volume corresponds to an S3 bucket. Each bucket
automatically contains two subfolders `snapshots` and `data` which correspond
to the current state TFS volume (`data`) and any snapshots of the volume which
which have been taken.

## Activating the S3 Endpoint

Presuming you have an existing TFS installation the primary means of enabling
access to the S3 endpoint is to enable an ingress to the TFS services.  Since
S3 clients do not normally tolerate the S3 endpoint being located in a subpath
the ingress should be configured such that the `/` path of the ingress points
to the S3 service, and a subpath, e.g. `/tfs`, points to the service for the
TFS native API, i.e. the default. For example, the following ingress
configuration will enable access to the S3 API behind a hostname of
`tfs.example.com`

```yaml
ingress:
  enabled: true
  hostname: tfs.example.com
  path: /tfs
  annotations:
    kubernetes.io/ingress.class: "nginx"
  extraPaths:
    - path: /
      pathType: ImplementationSpecific
      backend:
        service:
          name: mydeployment-tfs-tfs-on-sawtooth
          port:
            number: 8001
```

*NOTE* `mydeployment` above should be replaced with your deployment name

## Connecting to the S3 API

For the purposes of this example we will be using the _MinIO Client_ from
[MinIO](https://min.io) which may be obtained and installed using instructions
found [here](https://min.io/download#).

The S3 Base URL used to connect to the api is the URL of the ingress that you
configured above.  For example if your Ingress hostaname is `tfs.example.com`
then the the S3 Base URL you will use is `http://tfs.example.com` or
`https://tfs.example.com` depending on whether the ingress or ingress
controller is configured to use TLS (this is always recommended).

**NOTE**: As of this writing encrypted volumes are not supported via the S3 API,
even though they will be displayed.

Now we set an alias for `mc` to use:

```bash
mc alias set example http://tfs.example.com "" ""
```

Now we can list the currently available volumes via

```bash
$ mc ls example
[2021-09-30 16:24:42 EDT]     0B exampleVolume/
```

And if we look into the `exampleVolume` listed we will see the following:

```bash
$ mc ls -r example /exampleVolume
[2021-09-30 16:26:22 EDT]     0B exampleVolume/data/
[2021-09-30 16:26:22 EDT]     0B exampleVolume/snapshot/
```

Notice the `data` and `snapshot` folders that were mentioned earlier.

All _write_ operations must take place in the `data` folder. For example:

```bash
$ mc cp ./debug.log.gz example/exampleVolume/data/
./debug.log.gz:                326.89 KiB / 326.89 KiB
```
