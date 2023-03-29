# Ensure Docker Desktop is running locally
docker --version
# Step 1:
# Build image and add a descriptive tag
docker build --tag <DockerHubUsername>/<DockerImageName>:<tag> .
# Step 2: 
# List docker images
docker images
# Step 3: 
# Run flask app and list containers
docker run -d -p 8000:80 <DockerHubUsername>/<DockerImageName>:<tag> .
docker ps

