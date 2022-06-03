#!/bin/bash
# Script to K8s services describing pods

#set -e

# switch to appropriate cluster
az aks get-credentials --resource-group $resourcegroup --name $clustername
#kubectl config use-context $clustername

echo "$@"

array=[]

for array in $(kubectl -n get po $namespace)
do
    if [pod in array]
    then
        kubectl -n describe po $array $namespace
    else
        echo "---------------------"
