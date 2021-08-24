
# Attaching to a pre-existing network

## General Considerations

  In order to connect two separate deployments of __besu__
  the following prerequesites must be satisfied:

* bi-directional connectivity for the TCP and UDP protocols on the
  `besu.p2p.port` (default: `30303`) between the child network and
  the bootnodes

* at least two bootnodes are recommended to be accessible for reliability

* the appropriate kubernetes docker secrets are available on each cluster

## On the "seed network"

In other words the original network

1. make sure that sextant has the most recent charts.  To be sure, you can
    administratively restart sextant which will refresh the charts
        * The most recent charts for besu define services specific to
          each besu node, providing more stable endpoints for use by elements
          outside of the network

1. Undeploy the existing network

1. Redeploy the network

1. __Manual step__:
   Since network configurations and environment capabilities
   vary widely this is not automated by the chart. For each node
   intended to be accessed outside of the cluster an ingress,
   or loadbalancer needs to be created pointing to the
   corresponding pod service. Which is chosen will depend
   strongly on the ingress types and loadbalancer capabilities
   of your chosen platform.

   *Note:* the ip addresses or hostnames by which external nodes will
      contact these services

1. Copy the "Additional YAML" section from the parent network

1. Obtain the genesis configuration from the seed (original) network

   If the upstream network is Sextant deployed, then the easiest way to obtain
   this information is as follows. If your deployment is named `testbesu` in the
   namespace `test` this may be accomplished via the following command.

   ```bash
   kubectl get cm testbesu-besu-genesis -n test \
       -o jsonpath='{.data.genesis\.json}'
   ```

   Please note that the output of this will not necessarily have a
   newline at the end. Save this output it will be used later in the
   configuration of any secondary networks.

1. Get the basic enode url for each node you intend to use as a bootnode. This
   should be provided to you from the upstream network.

   Again, if the upstream network is Sextant deployed, then it is easiest to
   obtain this via the following command.  Be careful to substitute the name of
   the deployment as well as the desired besu node pod.

   ```bash
   kubectl get secret testbesu-besu-besu-enode  \
   -n test \
   -o jsonpath='{.data.testbesu-besu-besu-0\.enode}'|base64 -d
   ```

   Again please note that the output here will most likely not be terminated
   in a newline.

## Create a new deployment in sextant for the child network

Go to the "Additional Yaml Section"

1. paste in the "Additional YAML from the parent network

1. Add the following parameters to that YAML being sure to merge these
   fields with the existing configuration rather than overwriting

    ```yaml
    besu:
      # seedGenesis prevents the childnetwork from running genesis
      seedNetwork: false
      # in seedGenesis you paste the genesis config you obtained from parent
      # network be careful with indentations to make this a properly
      # formatted yaml string block
      # For example:
      #
      # seedGenesis: |
      #   {
      #     "coinbase" : "0x0000000000000000000000000000000000000000",
      #     "config" : {
      #       "chainId" : "19750424",
      #       "constantinoplefixblock" : 0,
      #       "ibft2" : {
      #         "blockperiodseconds" : 2,
      #         "epochlength" : 30000,
      #         "requesttimeoutseconds" : 10
      #       }
      #     },
      #     "nonce" : "0x0",
      #     "gasLimit" : "0x7fffffffffffff",
      #     "mixHash" : "0x63746963616c2062797a616e74696e65206661756c7420746f6c6572616e6365",
      #     "contractSizeLimit" : 2147483647,
      #     "difficulty" : "0x1",
      #     "alloc" : {
      #       "0000000000000000000000000000000000000075" : {
      #         "balance" : "0xad78ebc5ac6200000"
      #       },
      #       "0000000000000000000000000000000000000076" : {
      #         "balance" : "0xad78ebc5ac6200000"
      #       }
      #     },
      #     "extraData" : "0xf87ea00000000000000000000000000000000000000000000000000000000000000000f854947fc2a071e559220cf3e4e186fc8777b11176889e94ed7191a3cfe63a29699929e55300b0ab425633ca9483e0a019a01d7368bd53c83bd1f682e86422d4d894fb36fb86fff4e6b3f06826d5dae5995dcdf2f731808400000000c0"
      #   }
      seedGenesis: |
        {
        ...
        }
      # additionalBoodnodeUrls is a list of objects of the form
      # - pubkey: <public key of the node without leading 0x>
      #   host: <hostname or ip address to contact the node on>
      #   port: <port to contact the node, usually 30303>
      #
      # please note host fields must either be ip addresses or resolvable
      # DNS names, and the below is just an example
      additionalBootnodeUrls:
        - pubkey: 0b05d45f088ffb61c74808773d243f707bfa6902e4a57916d44b4f45533d92070845307d19f072cad99d5bc10b0d17e6f2961995b667c9267516f6389f2e5204
          host: testbesu-besu-1.testbesu-besu.testbesu.svc.cluster.local
          port: 30303
    ```

1. Save that Additional Yaml and deploy the network.

   Provided there are no issues with the network, the besu nodes should
   start and immediately begin synchronizing with the parent network.
