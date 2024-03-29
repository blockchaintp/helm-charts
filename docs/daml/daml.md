# Introduction

[Daml](https://daml.com) is a smart contract language based on declarative and
functional paradigms. It is implemented on several different distributed ledgers
including blockchains ([Besu](../daml-on-besu/README.md),
[Sawtooth](../daml-on-sawtooth/README.md), [QLDB](../daml-on-qldb/README.md),
et al) as well as traditional databases
([Postgres](../daml-on-postgres/README.md)). From the perspective of the Daml
contract developer there is no difference between these platforms and the APIs
presented by Daml are identical across all ledgers given the same Daml version.
Fully documenting Daml is beyond the scope of this documentation, but excellent
and thorough documentation may be found at <https://daml.com>.

Notably useful pages within the Daml site to look at are:

* [Getting Started](https://daml.com/learn/getting-started)
* [Documentation](https://docs.daml.com/index.html)
* [Interactive Tutorials](https://daml.com/learn?hsLang=en)

## Implementation Notes

Across all of our Daml implementations there are a few recurring infrastructure
themes which are usefully discussed without respect to a particular ledger.

### Time

Time, "ledger time", or "record time" is a significant feature in all Daml
ledger implementations.  All of the ledgers we support have a running "wall
clock" this clock is guaranteed to monotonically increase on every ledger, and
corresponds to but is not necessarily exact when compared to an high accuracy
time service.

In blockchain based ledgers the ledger time is a consensus mediated time that
can be agreed upon by all validating nodes in the network.

In centralized ledgers (such as Postgres or currently QLDB) this time is based
on the machine time of the servers running on the node.

Regardless the time is always guaranteed to monotonically increase with respect
to the ledger records.

### Caching and Package Warm-up

Daml contracts are effectively instances of templates within packages loaded in
to the ledger.  For a given process running the Daml runtime engine, the first
time a package is uploaded, or the first time a contract instance of a template
is exercised (whichever happens first over the lifetime of the process), the
template code is loaded into memory and compiled.  This compiled code is then
cached and kept in memory.  This "warm-up" behavior will be repeated on any
process that is restarted. This can have varying effects, up to and including
producing GRPCIOTimeouts on calls while the templates are being compiled.

Certain of the ledger implementations have some hints and pre-loading to
mitigate this behavior but it is a good idea to bear it in mind while developing
you're application.

### Connectivity

Access to a Daml ledger is accomplished via one of two protocols:
[GRPC](https://docs.daml.com/app-dev/grpc/index.html), or via the
HTTP based [JSON-API](https://docs.daml.com/json-api/index.html).

While it is customizable in all of our deployments, the default for BTP
deployments is to place the GRPC endpoint on port `39000` and the JSON-API port
at port `8080`.  In each case the access is governed via the use of JWT tokens.

### Security

Daml ledger API access and authorization is controlled through the use of JWT
tokens(discussed in details [here](https://docs.daml.com/app-dev/authorization.html)).
These may be

1. Generated via the Sextant UI.

2. Generated by hand using the certificate created as a config map in the helm
   deployment

3. The deployment may be pointed at a [JWKS](https://auth0.com/docs/tokens/json-web-tokens/json-web-key-sets)
   server and that servers tools used to generate tokens, e.g. [Keyclock](https://www.keycloak.org/)
   or [Auth0](https://auth0.com)
