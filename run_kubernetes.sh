#!/usr/bin/env bash
aws eks --region us-east-1 update-kubeconfig --name CapstoneADLRM-Cluster-1234
kubectl create deployment capstoneadlrm-microservice-1234 --image=adelarubiam/capstone_adlrm:v0.1.26
kubectl expose deployment capstoneadlrm-microservice-1234 --port=8000 --target-port=80 --type=LoadBalancer --name=capstoneadlrm-microservice-1234

