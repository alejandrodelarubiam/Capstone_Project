## Summary of the Project

In this Capstone Project a Simple Python (v.3.8.10) "Hello World" application is containerized in Docker, being then uploaded in DockerHub, deployed and exposed through a LoadBalancer in a EKS Cluster, and, after it is tested with a Smoke Test. Finally, Old Stacks are cleaned up. 

In this project the following instructions have been performed on the same CircleCI pipeline:

* Dockerfile is linted using Hadolint.
* App.py file is linted using Pylint.
* Application is containerized and uploaded to DockerHub using Dockerfile.
* Infrastructure (Cluster, Network and Nodes) is deployed using CloudFormation template (infrastructure.yml).
* App is deployed on one of the Nodes and exposed through an Elastic Load Balancer (ELB).
* After being deployed, a smoke test is performed on the endpoint.
* Finally, a cleanup of Old Stacks is made.
* If the app fails when being deployed/explosed or smoke test is not correct, pipeline is aborted.

## Instructions: How to run the Python web App

* First, a virtualenv with Python 3.8.10 needs to be created and activated, then all the dependencies must be installed using the Makefile.
```bash
python3 -m pip install --user virtualenv
python3 -m virtualenv --python=<path-to-Python3.8.10> .devops
source .devops/bin/activate
make install
```
### Different ways of running the application:

1. Standalone:  `python app.py`
2. Docker Run:  Replace parameters by the ones which applies to you and execute `./scripts/run_docker.sh`
3. Docker Upload: If uploading the image is desired, replace parameters by the ones which applies to you and execute `./scripts/upload_docker.sh` 
4. Kubernetes: Replace parameters by the ones which applies to you and execute `./script/run_kubernetes.sh`

### Pipeline explanation (./.circleci/config.yml):

1. *Linting*:  pylint and hadolint are performed over app.py and Dockerfile respectively.
2. *Docker-build*:  Docker image is built and pushed to DockerHub repository, tag is preserved for future steps.
3. *Deploy-infrastructure*: Cluster, Networking and NodeGroup are created, due it may take more than 10 minutes "no_output_timeout" property is set.
4. *Deploy-to-eks*: After EKS authentication on Cluster, deployment is created and exposed. Due to ELB's DNS can take a while to replicate and be able, a "Sleep" of 5 minutes is set before smoke test to avoid Host resolving issues.
5. *Smoke-test*: A Curl command is performed to the app, in order to check if is available.
6. *Cleanup*: It lists all stacks, compare ID's with current Workflow ID, if it is different, are cleaned because they are old.
7. *Destroy-environment* and *Destroy-kubernetes*: If some step fails after creating Infrastructure, it destroys Infrastucture and Kubernetes Deployment and Service respectively, Kubernetes features must be destroyed first to avoid failing when destroying the CloudFormation Stack.

![Pipeline](https://github.com/alejandrodelarubiam/Capstone_Project/blob/master/Pipeline_Capstone.png?raw=true)

### Explanation of the files in the repository.

* `app.py`: Core of application, it shows a "Hello World!" message.
* `.circleci folder` and `.circleci/config.yml` file: needed for performing CircleCI integration of our app.
* `.circleci/files/infrastructure.yml`: CloudFormation Template of the Infrastructure (Cluster, Network, Nodes)
* `.circleci/files/tag.txt`: File to persist Docker generated tag between CircleCI steps.
* `Dockerfile`: it creates a working directory, copies the files on it, install dependencies, exposes ports and run app.py on container.
* `Makefile`: It creates and activates a virtual environment, install dependencies, and performs hadolint and pylint.
* `requirements.txt`: Requirements needed to run Flask app.
* `./scripts/run_docker.sh`: It builds an image with a descriptive tag, lists docker images, run app and list containers.
* `./scripts/upload_docker.sh`: Tags and uploads an image to Docker Hub.
* `./scripts/run_kubernetes.sh`: It runs provided Docker Image on Kubernetes, lists pods and forwards container port to host.
* `RUBRIC_EVIDENCES` folder: Folder with screenshots of each of the points required in project's rubric to ease the review task.