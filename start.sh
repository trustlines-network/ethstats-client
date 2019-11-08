#! /bin/bash

set -e

WS_USER=$(echo "$WS_USER" |sed -e 's/^[ \t]*//' -e 's/[ \t]*$//')
WS_PASSWORD=$(echo "$WS_PASSWORD" |sed -e 's/^[ \t]*//' -e 's/[ \t]*$//')
: "${WS_HOST:=netstatstc1.trustlines.foundation}"

exec /usr/bin/env WS_SERVER="wss://$WS_USER:$WS_PASSWORD@$WS_HOST" node ./app.js
