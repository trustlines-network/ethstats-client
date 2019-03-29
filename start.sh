#! /bin/bash

set -e

exec /usr/bin/env WS_SERVER=ws://$WS_USER:$WS_PASSWORD@142.93.106.131 node ./app.js
