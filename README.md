# sparkoperator-demo


This repo aims to setup sparkoperator in your local environment in minikube with simple steps.

## Prerequisites
- Docker
- Minikube
- Helm
- Kubectl
## Set up local environment

Sets up the local environment with spark operator
```bash
./setup.sh
```

## Run the spark sample application
Run the application using the following command
```bash
kubectl apply -f spark-pi.yaml
```

## Cleanup the environment
Remove the application files
```bash
kubectl delete -f spark-pi.yaml
```

Remove the installed files
```bash
./cleanup.sh
```