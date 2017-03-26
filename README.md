# Docker ML: Docker image for Machine Learning

Reference: https://docs.docker.com/engine/getstarted/

## This Docker image

- Cloned from Caffe, CPU version
- Ubuntu 16.04, Python 2.7.x environment
- Contains TensorFlow, Theano, Scikit-Learn Caffe, OpenCV, Numpy, Pandas, IPython

## How to use

### 1.a) Install

- `docker run suryak/mlenv` or *follow 1.b*

### 1.b) Install

1. Download this repository, open terminal and change directory into it
2. `docker build -t <username>/mlenv .`
3. `docker push <username>/mlenv`

### 1.c) Using container

```
# Create IPython command line
$ docker run --name mlenv -ti suryak/mlenv ipython

# Restart the same container
$ docker start -i mlenv

# Open Bash
$ docker exec -it mlenv bash

# Stop the container explicitly if not using --rm
$ docker stop mlenv
```

### 1.d) IPython Notebook with docker environment

```
docker run 
       [--name] <container-name>
       [--rm] <delete after exit>
       [-it] <interactive>
       [-d] <run in the background>
       [-v path-in-local-filesystem:path-in-docker-filesystem] <mount the paths>
       [-w path-in-docker-filesystem]
       -p 8888:8888 <port>
       suryak/mlenv <image>
       sh -c "jupyter notebook --ip=* --no-browser"

Example:

# Create container the first time
$ docker run --name mlenv -it -v $(pwd):/workspace -w /workspace -p 8888:8888 suryak/mlenv sh -c "jupyter notebook --ip=* --no-browser"

# Next time
$ docker start mlenv   # Runs IPython Notebook by default; Background task. 
$ docker exec -it bash  # Open shell
$ docker stop mlenv # stop the container
```

Open the notebook at: `http://localhost:8888/tree?token=xxxxx`

### 2) Frequrently used docker commands

```
# check existing containers
$ docker ps -a

# check existing images
$ docker images -a

# remove image
$ docker rmi suryak/mlenv

# remove container
$ docker rm <container name / id>

# execute in container (interactive -it)
$ docker exec -it <container name / id> <command>

# start stopped containers (-i for interactive i.e., wait for user)
$ docker start <container name / id>

# stop container
$ docker stop <container name / id>

# pull image from docker hub
$ docker pull suryak/mlenv 

# push to hub
$ docker push suryak/mlenv

# build image
$ cd <path to docker file>
$ docker build -t <new-image-name> .

# update container changes to image
$ docker commit <container-id>/name <image-id/name>
$ docker push
```

There are interesting ways to minimize redoing tasks. Keep an eye on them.

### 3) Issues

- This bug on Mac is amusing: https://github.com/docker/for-mac/issues/371

