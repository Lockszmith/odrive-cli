#! /bin/bash

OD="$OD_ROOT/bin/odrive"
ODAGENT="$OD_ROOT/bin/odriveagent"

echo -n Starting odrive agent . . .
"$OD_ROOT/bin/odriveagent" > /var/log/odriveagent.log &
sleep 1s
echo Done.

if [[ -n "${OD_AUTH}" ]]; then
  echo -n Setting authentications . . .
  $OD authenticate $OD_AUTH
  echo Done.

  $OD mount /data /
fi  

$OD status

#OD_MAX_DEPTH=
OD_MIN_DEPTH=${OD_MIN_DEPTH:-3}

exec 6>&1
num_procs=${OD_SYNC_PROC:-2}
output="go"
while :; do
  output=$(find "/data/" -mindepth $OD_MIN_DEPTH -regex ".*\.cloudf?$" -print0 | xargs -0 -n 1 -P $num_procs $OD sync | tee /dev/fd/6 | tee --append /var/log/odrive/sync.log )
  sleep ${OD_SYNC_PAUSE:-10s}
done

# tail --follow /var/log/odriveagent.log
