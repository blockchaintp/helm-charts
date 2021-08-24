# Using An External Index Database

## Steps

1. [Disable the default embedded postgres](#disable-the-default-embedded-postgres-database)

2. [Set the database url](#set-the-database-url)

## Disable the default embedded postgres database

In order to disable the default embedded postgres database, set the
`postgres.enabled=false`

```yaml
postgres:
  enabled: false
```

## Set the database url

There are two options to set the database url.

### First option

Point the daml rpc to the external database by setting
`daml.rpc.postgres_url` to a jdbc url value of the format described
[here](https://jdbc.postgresql.org/documentation/80/connect.html)

```yaml
daml:
  rpc:
    postgres_url: jdbc:postgresql://somehost.example.com/somedb?user=fred
```

This has the effect of setting an environment variable `POSTGRES_URL` which
is used by the rpc to connect.

### Second option

If the URL contains a password then then it is more secure to
put the url value into a secret. In this the url should be provided via a
`POSTGRES_URL` environment variable set directly with its value provided by
a secret. For example:

```yaml
daml:
  rpc:
    env:
      - name: POSTGRES_URL
        valueFrom:
            secretKeyRef:
              name: myPostgresSecret
              key: postgres_url
```
