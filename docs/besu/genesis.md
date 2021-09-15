# Customizing The Genesis Block

By default the deployment creates an ethereum network with a genesis block that
is configured for IBFT and allocates no additional accounts.  If a different
configuration is desired, the genesis may be configured in multiple ways.

## 1. Allocating Additional Accounts In The Genesis Block

To allocate in the genesis block additional accounts, all that is necessary is
to add some yaml into the values provided to the chart. While the allocation
is normally expressed in YAML it may also be expressed in JSON.  For example:

```yaml
besu:
  genesis:
    alloc:
      fe3b557e8fb62b89f4916b721be55ceb828dbd73:
        privateKey: "8f2a55949038a9610f50fb23b5883af3b4ecb3c3bb792cbcefbd1542c692be63"
        comment: |
          private key and this comment are ignored. In a real chain, the private
          key should NOT be stored
        balance: "0xad78ebc5ac6200000"
```

## 2. Completely Custom Genesis configuration

In order to completely customize the genesis provide values similar to the following:

```yaml
besu:
  seedGenesis: |-
    {
      "coinbase" : "0x0000000000000000000000000000000000000000",
      "config" : {
        "chainId" : "19750424",
        "constantinoplefixblock" : 0,
        "ibft2" : {
          "blockperiodseconds" : 2,
          "epochlength" : 30000,
          "requesttimeoutseconds" : 10
        }
      },
      "nonce" : "0x0",
      "gasLimit" : "0x7fffffffffffff",
      "mixHash" : "0x63746963616c2062797a616e74696e65206661756c7420746f6c6572616e6365",
      "contractSizeLimit" : 2147483647,
      "difficulty" : "0x1",
      "alloc" : { },
      "extraData" : "0xf87ea00000000000000000000000000000000000000000000000000000000000000000f85494803851fc04d636dfd9302f8f6022f80cd852bb2094f7ad4cb57db3d2c338aa7d0d97dbce984d2a8e6694f75fb493d8efcb60179b27bf6fcf6d0a9063a2f694052754b69174c37db8e6f08462a043bb080b6d99808400000000c0"
    }
```

This genesis will then be used regardless of whether the network is a seed one
or not.
