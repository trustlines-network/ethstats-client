# ethstats client

This is the backend service which runs along with parity and tracks the
network status, fetches information through JSON-RPC and connects through
WebSockets to the ethstats-server. You can view the ethstats page for the [trustlines testnet here](http://142.93.106.131)

## Installation as docker container

The following assumes you're running a parity node inside docker either as
validator or as observer and you have already received your credentials from  First, create a file named `netstats-env` with the
following content:

```
WS_USER=username-as-provided-by-the-foundation                                                                    
WS_PASSWORD=password-as-provided-by-the-foundation
INSTANCE_NAME=please-choose-a-nice-name-here                                                      
```

Please start the docker container with:
```
docker run --name netstats -d --restart=always --env-file netstats-env --link trustlines-testnet:parity trustlines/netstats-client
```

This command assumes that your container running parity is named
`trustlines-testnet`. Please adapt the command if necessary.
