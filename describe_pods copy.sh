#!/bin/bash
arr=($(kubectl get pods --no-headers -o custom-columns="NAME:.metadata.name,STATUS:.metadata.status" -n $namespace))
for value in "${arr[@]}"
do
    echo $value
    kubectl describe pod $value -n $namespace
    echo "================================================================================="
done

kubectl get pod -o=jsonpath='{range .items[*]}{.metadata.name}{"\t"}{.status.phase}{"\n"}{end}