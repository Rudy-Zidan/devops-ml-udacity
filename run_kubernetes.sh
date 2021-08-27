#!/usr/bin/env bash

# This tags and uploads an image to Docker Hub

# Step 1:
# This is your Docker ID/path
dockerpath=rudyzidan/ml-udacity

# Step 2
# Run the Docker Hub container with kubernetes
kubectl run ml-udacity --image=$dockerpath --port=80 --labels app=ml-udacity

# Step 3:
# List kubernetes pods
kubectl get pods

# Step 4:
# Forward the container port to a host
sudo -E kubectl port-forward ml-udacity 80:80

