## Summary of the Project

In this Capstone Project a Simple Python "Hello World" application is containerized in Docker, being then uploaded in DockerHub and Deployed in a EKS Cluster, af

In this project the following instructions have been performed:

* Using Hadolint and Pylint to test your project code.
* Application will be containerized and deployed using Dockerfile and scripts containing Docker commands.
* Make a prediction in the app containerized by Docker.
* Adding in the app.py code log statements of prediction's output.
* Installing Kubernetes and creating a local (i.e Minikube) or Cloud Provider (i.e EKS)
* Writting a script which deploys a Kubernetes container of the app and making a prediction.
* Uploading all the content in a public GitHub repo, running a CircleCI successful pipeline.

## Instructions: How to run the Python scripts and web app 

* First, a virtualenv with Python 3.7 needs to be created and activated, then all the dependencies must be installed using the Makefile.
```bash
python3 -m pip install --user virtualenv
python3 -m virtualenv --python=<path-to-Python3.7> .devops
source .devops/bin/activate
make install
```
### Different ways of running the Flask application:

1. Standalone:  `python app.py`
2. Docker:  `./run_docker.sh`
3. Kubernetes:  `./run_kubernetes.sh`

### Docker and Kubernetes Steps

* Setup and Configure Docker locally, using [official Docker documentation](https://docs.docker.com/engine/install/).
* Setup and Configure [Kubernetes](https://kubernetes.io/releases/download/#kubectl) as well as a tool which can create a Kubernetes cluster locally (i.e [Kind, kubeadm or minikube](https://kubernetes.io/docs/tasks/tools/)).
* By running `./run_docker.sh` we will have our application in a local Docker container.
* By running `./run_kubernetes.sh` we will have our application in a local Kubernetes pod in a local cluster.

### Explanation of the files in the repository.

* .circleci folder and .circleci/config.yml file: needed for performing CircleCI integration of our app.
* Dockerfile: it creates a working directory, copies the files on it, install dependencies, exposes ports and run app.py on container.
* Makefile: It creates and activates a virtual environment, install dependencies, and performs hadolint and pylint.
* app.py: Core of application, it has been edited adding a log output of the prediction result.
* make_prediction.sh: Script which makes a POST request, with an included payload.
* ./run_docker.sh: It builds an image with a descriptive tag, lists docker images, run flask app and list containers.
* ./upload_docker.sh: Tags and uploads an image to Docker Hub.
* ./run_kubernetes.sh: It runs provided Docker Image on Kubernetes, lists pods and forwards container port to host.
* output_txt_files/docker_out.txt: Log output of the application being run in Docker Container.
* output_txt_files/kubernetes_out.txt: Log output of application, port-forwarding and pod status.
* CUSTOMIZED FILES:
* * LoadTest_Demo_Alejandrodelarubia.mp4: Demo video of a load test with Locust in the app, testing HPA scale up and down.
* * RUBRIC_EVIDENCES folder: Folder with screenshots of each of the points required in project's rubric to ease the review task.