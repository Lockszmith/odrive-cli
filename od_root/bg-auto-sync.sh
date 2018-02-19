#! /bin/bash

DEPTH=$1
DEPTH=${DEPTH:-3}

./auto-sync.sh $DEPTH &

