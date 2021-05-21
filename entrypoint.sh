#!/bin/bash
set -e

if [ "$1" = 'ucd' ]; then
  /tmp/ibm-ucd-install/install-server.sh -silent -install-dir /opt/ucd/server -java /usr/local/openjdk-8
  exec /opt/ucd/server/bin/server run

elif [ "$1" = 'sleep' ]; then
  while true; do
    echo "running sleep";
    sleep 10;
  done;
fi;
