#!/bin/bash

NAMESPACE_NAME=pillowfight

echo `date`"   ### Applying kubernetes yamls to namespace ${NAMESPACE_NAME}"
kubectl create namespace ${NAMESPACE_NAME}
#kubectl apply -f k8s.yaml -n ${NAMESPACE_NAME}
helm install pillowfight ./pillowfight -n ${NAMESPACE_NAME}
#kubectl get pods -n ${NAMESPACE_NAME}
#kubectl logs pillowfight-ID --follow -n ${NAMESPACE_NAME}
echo `date`"   ### Pillow fight(s) started. Please check couchbase console"