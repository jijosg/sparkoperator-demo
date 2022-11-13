#!/usr/bin/env bash

helm uninstall my-release -n spark-operator
helm repo remove spark-operator
kubectl delete crd scheduledsparkapplications.sparkoperator.k8s.io 
kubectl delete crd sparkapplications.sparkoperator.k8s.io      
kubectl delete namespace spark-operator