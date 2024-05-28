#!/usr/bin/env bash
if minikube status >/dev/null 2>&1; then
    echo "Minikube is already running."
else
    echo "Starting Minikube..."
    minikube start || { echo "Failed to start Minikube. Please make sure Minikube is installed."; exit 1; }
    minikube status | grep "Running" >/dev/null 2>&1
    while [ $? -ne 0 ]; do
        echo "Waiting for Minikube to be ready..."
        sleep 5
        minikube status | grep "Running" >/dev/null 2>&1
    done
fi
helm repo add spark-operator https://kubeflow.github.io/spark-operator
helm repo update
helm install my-release spark-operator/spark-operator --namespace spark-operator --create-namespace --set sparkJobNamespace=default --set 'image.repository=ghcr.io/googlecloudplatform/spark-operator' --set 'image.tag=v1beta2-1.4.3-3.5.0'
kubectl apply -f spark-pi.yaml