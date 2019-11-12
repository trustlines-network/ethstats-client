# ethstats client

This is the backend service which runs along with parity and tracks the
network status, fetches information through JSON-RPC and connects through
WebSockets to the ethstats-server. You can view the ethstats page for the 
[Trustlines Blockchain](https://netstats.tlbc.trustlines.foundation/) here and for the 
[trustlines testnet here](https://laikanetstats.trustlines.foundation/).

The netstats page gives a rough overview of the current network state.
It is an optional component of the Trustlines Blockchain / Laika 
which helps the community by providing information on running nodes to a central server.

To participate, validators need to request credentials managed by the Trustlines Foundation.
Please email `netstats@trustlines.foundation` to do so.

## Installation as docker container

The following assumes you're running a parity node inside docker either as
validator or as observer and you have already received your credentials from the
trustlines foundation.

First, create a file named `netstats-env` with the following content:

```
WS_USER=username-as-provided-by-the-foundation                                                                    
WS_PASSWORD=password-as-provided-by-the-foundation
INSTANCE_NAME=please-choose-a-nice-name-here                                                      
```
In case you want to show your validator status (mining is active and coinbase) 
then add the following line (default setting is true):
```
HIDE_VALIDATOR_STATUS=false
```

Please start the docker container with:
```
docker run --name netstats -d --restart=always --env-file netstats-env --link trustlines-testnet:parity trustlines/netstats-client:master
```

This command assumes that your container running parity is named
`trustlines-testnet`. Please adapt the command if necessary.

E.g. with the following command you could connect to a parity instance running on the local machine:

```
docker run --name netstats -d --restart=always --env-file netstats-env -e RPC_HOST=127.0.0.1 --network=host trustlines/netstats-client:master
```
