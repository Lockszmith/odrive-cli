#! /bin/bash

DEPTH=$1
DEPTH=${DEPTH:-3}

echo =============================================================== | tee --append /var/log/odrive/sync.log
date | tee --append /var/log/odrive/sync.log
find /data -mindepth $DEPTH -name "*.cloudf" -exec odrive sync {} \; | tee --append /var/log/odrive/sync.log
