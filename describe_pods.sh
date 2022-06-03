#!/bin/bash
# Script to K8s services describing pods

#set -e

# switch to appropriate cluster
az aks get-credentials --resource-group $resourcegroup --name $clustername
#kubectl config use-context $clustername

echo "$@"

pods() {
    deployment=$1

        # we use grep to filter out specific pods
        for pod in $(kubectl -n $namespace get pods | grep ^${deployment}- | cut -f 1 -d ' '); do
            echo ---------------------------
            echo $pod
            #if [ "$pod" == "prometheus-prometheus-0" ]; then
                # echo ---------------------------
                # kubectl -n $namespace logs $pod $deployment
            if [ "$pod" in $deployment ]; then
                echo ---------------------------
                kubectl -n $namespace describe pods $pod 
            else
                echo $pod
                echo ---------------------------
                kubectl -n $namespace describe pods $pod $deployment
            fi
        done
#       "ambassador")
#         for pod in $(kubectl -n $namespace get pods | grep ^${deployment}- | cut -f 1 -d ' '); do
#             echo ---------------------------
#             echo $pod
#             echo ---------------------------
#             kubectl -n $namespace describe pods $pod $deployment
#         done
#       "rudderstack")
#         for pod in $(kubectl -n $namespace get pods | grep ^${deployment}- | cut -f 1 -d ' '); do
#             echo ---------------------------
#             echo $pod
#             echo ---------------------------
#             kubectl -n $namespace describe pods $pod rudderstack-backend
#         done
#       *)
#         #echo "Fetching logs for $deployment"
#         echo "Describing pods for $deployment"
#         count=0
#         for pod in $(kubectl -n $namespace get pods | grep ^${deployment}- | cut -f 1 -d ' '); do
#             echo ---------------------------
#             echo $pod
#             echo ---------------------------
#             kubectl -n $namespace describe pods $pod $container
#             count=$(expr $count + 1)
#         done
#         if [ $count -eq 0 ]; then
#             echo "No pods found for $deployment with selector app=$deployment"
#             echo
#         fi
#     esac
  }

# echo -e "\n\n=============="
# pods "$@"
# echo -e "\n\n=============="