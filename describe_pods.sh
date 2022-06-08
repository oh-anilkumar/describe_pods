#!/bin/bash
for podname in $(kubectl -n $namespace get pods | grep ^${deployment}- | cut -f 1 -d ' '); do
    echo "==============================================================================================================="
    echo $podname
    kubectl -n $namespace describe pod $podname
done
