# Ethstats Client

This is the backend service which runs along with Parity and tracks the
network status, fetches information through JSON-RPC and connects through
WebSockets to the ethstats-server. You can view the ethstats page for the
Trustlines Blockchain [here](https://netstats.tlbc.trustlines.foundation/) and for the
Laika testnet [here](https://netstats.laika.trustlines.foundation/).

The netstats page gives a rough overview of the current network state.
It is an optional component of the Trustlines Blockchain / Laika testnet.
It helps the community by providing information of running nodes to a central server.

To participate, validators need to request credentials managed by the Trustlines Foundation.
Please email `netstats@trustlines.foundation` to do so.

## Installation

The [quickstart
setup](https://github.com/trustlines-protocol/blockchain#setup-with-the-quickstart-script)
provides an easy way to run a Trustlines Blockchain node with a nestats client
connected to that. The following describes a manual setup with _Docker_. This
approach assumes that you're running a Parity node inside Docker either as
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

Please start the Docker container with:

```
docker run --detach \
  --name netstats \
  --restart=always \
  --env-file netstats-env \
  --link trustlines-testnet:Parity \
  trustlines/netstats-client:master
```

This command assumes that your container running Parity is named
`trustlines-testnet`. Please adapt the command if necessary.

E.g. with the following command you could connect to a Parity instance running
on the local machine:

```
docker run --detach \
  --name netstats \
  --restart=always \
  --env-file netstats-env \
  --env RPC_HOST=127.0.0.1 \
  --network=host \
  trustlines/netstats-client:master
```
