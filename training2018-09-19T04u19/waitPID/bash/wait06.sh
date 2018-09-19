#!/usr/bin/env bash
for lO in 2 5 3
do
  { lW=$lO; sleep $lW; echo "slept for $lW seconds."; } &
  lPIDs="$lPIDs $!"
done

while $( wait -n )
do
  echo "\$?=$?"
  sleep 0.125
done

echo "All PIDs:$lPIDs"
