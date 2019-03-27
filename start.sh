#! /bin/bash

set -e

exec /usr/bin/env WS_SERVER=ws://$WS_USER:$WS_PASSWORD@217.24.224.17 npm start
