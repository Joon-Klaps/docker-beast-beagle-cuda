# beast-beagle-cuda
GPU-accelerated Docker images containing [BEAST](http://beast.community/about) and [BEAGLE](http://beast.community/beagle), compiled with [NVIDIA CUDA](https://developer.nvidia.com/cuda-zone) support.
This repository tracks the releases of the [BEAST-repo](https://github.com/beast-dev/beast-mcmc) for building the containers. 

LATEST_VERSION = 'v10.5.0-beta5'

See https://hub.docker.com/r/jklaps/beast-beagle-cuda for all created versions.

## Singularity

[![run with singularity](https://img.shields.io/badge/run%20with-singularity-1d355c.svg?labelColor=000000)](https://sylabs.io/docs/)

```bash
singularity exec --nv -B $PWD docker://jklaps/beast-beagle-cuda:latest \
    java -Xms8g -Xprof -Xmx32g -Dbeast.plugins.dir="/usr/local/plugins/" -Djava.library.path="/usr/local/lib:" -cp "/usr/local/lib/beast.jar" dr.app.beast.BeastMain \
    -beagle_GPU \
    -working \
    <my-xml> \
    > beast.out
```

## Docker

[![run with docker](https://img.shields.io/badge/run%20with-docker-0db7ed?labelColor=000000&logo=docker)](https://www.docker.com/)

```bash
docker run --gpus all --mount type=bind,source=$PWD,target=/. jklaps/beast-beagle-cuda:latest \
    java -Xms8g -Xprof -Xmx32g -Dbeast.plugins.dir="/usr/local/plugins/" -Djava.library.path="/usr/local/lib:" -cp "/usr/local/lib/beast.jar" dr.app.beast.BeastMain \
    -beagle_GPU \
    -working \
    <my-xml> \
    > beast.out
```
