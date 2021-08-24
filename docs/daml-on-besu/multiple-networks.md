
# Attaching to a pre-existing network

## General Considerations

  Connecting a Daml on Besu to an upstream Daml on Besu network is for the most
  part identical to connecting a conventional network to an upstream (see
  [here](../besu/multiple-networks.md)) with the additions
  described below.

## Daml participant names

  Each daml network has at least one "participant" pod which is responsible for
  serving the API to the Daml clients. This is sometimes referred to as the RPC,
  or daml-rpc.  Each of these nodes must be given a unique name on the network.

  In order to configure the participant name, you must add the following to your
  yaml configuration, merged appropriately:

```yaml
daml:
  rpc:
    participantId: a-participantid-unique-on-the-network
```

  Remember each RPC on the Daml network should have a unique participantId under
  normal circumstances.
