#!/usr/bin/env bash
# This file tags and uploads an image to Docker Hub
# Assumes that an image is built via `run_docker.sh`

# Step 1:
# Create dockerpath
dockerpath="<DockerHubUsername>/<DockerImageName>:<tag>"
# Step 2:  
# Authenticate
docker login
echo "Docker ID and Image: $dockerpath"
# Step 3:
# Push image to a docker repository 
docker push $dockerpath