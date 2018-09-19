#!/usr/bin/env bash
for lO in 2 5 3
do
  { lW=$lO; sleep $lW; echo "slept for $lW seconds."; } &
  lPIDs="$lPIDs $!"
done

for lP in $lPIDs
do
  sleep 0.125
  wait $lP
  lR=$?
  echo "lP=$lP \$?=$lR"
done

echo "All PIDs:$lPIDs"
