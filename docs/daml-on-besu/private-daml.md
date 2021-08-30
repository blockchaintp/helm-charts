# Private Daml on Besu

Before proceeding be sure your Sextant helm [charts are up-to-date](../sextant/administrative-restart.md).

It is not possible to upgrade directly from the regular Daml on Besu to the private version.  A brand new network is required.

In addition to any the settings you may have set in your additional YAML the
following additional settings are required to enable private DAML on Besu:

```yaml
imagePullSecrets:
  enabled: true
  value:
    - name: your-secret # Replace with your access credentials

# to enable besu private transactions
besu:
  privacy:
    enabled: true

# To create the orion enclave within this deployment
orion:
  create: true

# The daml repeater is responsible for delivering transactions via Orin
daml:
  # The participant id of the installation, this should be unique
  # for every client
  participantId: "myparticipant"
  repeater:
    enabled: true
    # the participant id of the repeater, this should be left empty
    participantId:
global:
  postgresql:
    postgresqlPassword: your-password # Important this or the existingSecrets pattern must be set otherwise the various subcharts will not connect properly
```
