#! /bin/bash

DEPTH=$1
DEPTH=${DEPTH:-3}

while true; do
  ./sync-all.sh $DEPTH
  sleep 10s
done
