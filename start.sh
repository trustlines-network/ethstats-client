#! /bin/bash

set -e

WS_USER=$(echo "$WS_USER" |sed -e 's/^[ \t]*//' -e 's/[ \t]*$//')
WS_PASSWORD=$(echo "$WS_PASSWORD" |sed -e 's/^[ \t]*//' -e 's/[ \t]*$//')

exec /usr/bin/env WS_SERVER="wss://$WS_USER:$WS_PASSWORD@netstatstc1.trustlines.foundation" node ./app.js
