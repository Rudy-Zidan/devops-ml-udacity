[![CircleCI](https://circleci.com/gh/Rudy-Zidan/devops-ml-udacity/tree/master.svg?style=svg)](https://circleci.com/gh/Rudy-Zidan/devops-ml-udacity/tree/master)

## Project Overview

In this project, you will apply the skills you have acquired in this course to operationalize a Machine Learning Microservice API. 

You are given a pre-trained, `sklearn` model that has been trained to predict housing prices in Boston according to several features, such as average rooms in a home and data about highway access, teacher-to-pupil ratios, and so on. You can read more about the data, which was initially taken from Kaggle, on [the data source site](https://www.kaggle.com/c/boston-housing). This project tests your ability to operationalize a Python flask app—in a provided file, `app.py`—that serves out predictions (inference) about housing prices through API calls. This project could be extended to any pre-trained machine learning model, such as those for image recognition and data labeling.

### Project Tasks

Your project goal is to operationalize this working, machine learning microservice using [kubernetes](https://kubernetes.io/), which is an open-source system for automating the management of containerized applications. In this project you will:
* Test your project code using linting
* Complete a Dockerfile to containerize this application
* Deploy your containerized application using Docker and make a prediction
* Improve the log statements in the source code for this application
* Configure Kubernetes and create a Kubernetes cluster
* Deploy a container using Kubernetes and make a prediction
* Upload a complete Github repo with CircleCI to indicate that your code has been tested

You can find a detailed [project rubric, here](https://review.udacity.com/#!/rubrics/2576/view).

**The final implementation of the project will showcase your abilities to operationalize production microservices.**

---

## Setup the Environment

* Create a virtualenv and activate it.
```bash
  python3 -m venv ~/.devops
  source ~/.devops/bin/activate
```
* Run `make install` to install the necessary dependencies, will trigger the below command.
```bash
  pip install --upgrade pip &&\
		pip install -r requirements.txt
```

### Running `app.py`

1. Standalone:  `python app.py`
    - Will run the flask app standlone without docker or kubernetes
    - You can test by visiting "localhost:80".
2. Run in Docker:  `./run_docker.sh`
    - Will build the docker image.
    - Run the flask app over port 80 and forwarding the port 80 to the container exposed port (80).
3. Run in Kubernetes:  `./run_kubernetes.sh`
    - You can enable kubernetes through docker app over your local machine and change the context to "docker-desktop", then you can execute it safely.
    - Execute the following command: `kubectl config view`
    - You should see at least one certificate-authority and server.

### Kubernetes Steps

* Setup and Configure Docker locally
  - Create an account over [docker hub](https://hub.docker.com/)
  - Install docker, please visit this [link](https://www.docker.com/products/docker-desktop)
  - Check for docker version: `docker --version` in your terminal.
* Setup and Configure Kubernetes locally
  - Install minikube:
    - for windows check the [windows installer](https://minikube.sigs.k8s.io/docs/start/)
    - for macos `brew cask install minikube`
  - If you installed docker desktop, then you can just enable the kubernets through it from the settings.
  - Check for kubectl version: `kubectl version`
* Create Flask app in Container
  - Run the following command: `./run_docker.sh`, make sure to set your own dockerpath inside this file.
  - This will build and tag the docker image
  - After you see the app is up and running, you can execute `./make_prediction.sh` to test it.
  - You should see the predictions over STDOUT normally.
* Run via kubectl
  - Run the following command: `./run_kubernetes.sh`, make sure you already have a valid image with same dockerpath.
  - This will execute the following command: `kubectl run ml-udacity --image=$dockerpath --port=80 --labels app=ml-udacity`
  - You can update the labels to your preferences, also make sure that the image tag is used correctly `ml-udacity`.
