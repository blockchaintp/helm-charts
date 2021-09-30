# Using TFS within Docker Compose

To use the native TFS client within a Docker Compose, one container must act
as the TFS client and any other containers will share its `fuse` interface to
access the volume.

For the purposes of this document we will define a service as follows:

```yaml
version: '3.2'
services:
  taekion:
    image: dev.catenasys.com:8084/taekion/taekion-fs-client:0.6-s3-argos1
    privileged: true # Required
    init: true
    entrypoint:
      - bash
      - -ec
      - |
        mkdir -p /home/user/tfs_mount/data || true
        tfs-fuse --allow-other -v $VOLUME_NAME -m /home/user/tfs_mount/data
        tail -f /dev/null
    devices:
      - /dev/fuse # Required for the TFS client to function
    cap_add:
      - SYS_ADMIN
    environment:
      - TFS_URL
      - VOLUME_NAME
    volumes:
      - type: bind
        source: /tfs_mount # A directory on the host usable by docker
        target: /home/user/tfs_mount
        bind:
          propagation: rshared
  app:
    image: ubuntu
    entrypoint:
      - bash
      - -c
      - |
        tail -f /dev/null
    depends_on:
      - taekion
    volumes:
      - type: bind
        source: /tfs_mount # the same directory above
        target: /var/lib/tfs
        bind:
          propagation: rshared
```

This service requires the definition of two important environment variables in
order to work

- **TFS_URL** which provides both the TFS endpoint information as well as the
  authentication information for the TFS client.  This is obtained via the
  Sextant UI.
- **VOLUME_NAME** which is the name of the volume that will be mounted into the
  service

What is happening here is that the TFS client is being run and given access to
the host Linux systems `fuse` system as well and a directory which is used to
share that resulting bind mount volume across containers.  The end result is
that any containers which share the bind mount all will have access to the TFS
volume as if it were local.
