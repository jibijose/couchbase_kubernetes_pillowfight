#!/bin/bash

NAMESPACE_NAME=pillowfight

echo `date`"   ### Deleting kubernetes yamls to namespace ${NAMESPACE_NAME}"
#kubectl delete -f k8s.yaml -n ${NAMESPACE_NAME}
helm uninstall pillowfight -n ${NAMESPACE_NAME}
kubectl delete namespace ${NAMESPACE_NAME}
echo `date`"   ### All cleaned up"