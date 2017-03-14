# Docker ML: Docker image for Machine Learning

Reference: https://docs.docker.com/engine/getstarted/

## This Docker image

- Cloned from Caffe, CPU version
- Ubuntu 16.04, Python 2.7.x environment
- Contains TensorFlow, Scikit-Learn Caffe, OpenCV, Numpy, Pandas, IPython

## How to use

### 1.a Install

- `docker run suryak/mlenv` [or] follow 1.b

### 1.b Install

1. Download this repository, open terminal and change directory into it
2. `docker build -t <username>/mlenv .`
3. `docker push <username>/mlenv`

### 1.c Using IPython

`docker run suryak/mlenv --rm -ti ipython`

### 1.d IPython Notebook with docker environment

```
docker run 
       [--name] <container-name>
       [--rm] <delete after exit>
       [-it] <interactive>
       [-d] <run in the background>
       [-v path-in-local-filesystem:path-in-docker-filesystem] <mount the paths>
       -p 8888:8888 <port>
       suryak/mlenv <image>
       /bin/bash -c "jupyter notebook --notebook-dir=/workspace --ip=* --port=8888 --no-browser"

Example:


docker run \
       --name mlenv \
       --rm \
       -it \
       -p 8888:8888 \
       -v /tmp/notebooks:/workspace \
       suryak/mlenv \
       /bin/bash -c "jupyter notebook --notebook-dir=/workspace --ip=* --port=8888 --no-browser"
```

Open the notebook at: `http://localhost:8888/tree?token=xxxxx`
