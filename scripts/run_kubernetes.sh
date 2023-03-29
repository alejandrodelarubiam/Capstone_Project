#!/usr/bin/env bash
#First line just in case if you want to log in on a EKS Cluster.
aws eks --region ${AWS_DEFAULT_REGION} update-kubeconfig --name ${YOUR_CLUSTER_NAME}
kubectl create deployment ${MICROSERVICE_NAME} --image=<DockerHubUsername>/<DockerImageName>:<tag> 
kubectl expose deployment ${MICROSERVICE_NAME} --port=8000 --target-port=80 --type=LoadBalancer --name=${MICROSERVICE_NAME}

