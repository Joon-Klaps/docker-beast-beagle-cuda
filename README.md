# beast-beagle-cuda

GPU-accelerated Docker images containing [BEAST](http://beast.community/about) and [BEAGLE](http://beast.community/beagle), compiled with [NVIDIA CUDA](https://developer.nvidia.com/cuda-zone) support.

See https://hub.docker.com/r/jklaps/beast-beagle-cuda for all created versions.

**LATEST_VERSION = '1.10.5pre_thorney_0.1.2'**

## Instructions:

### Singularity

```bash
singularity exec --nv -B $PWD docker://jklaps/beast-beagle-cuda:latest \
    java -Xms8g -Xprof -Xmx32g -Dbeast.plugins.dir="/usr/local/plugins/" -Djava.library.path="/usr/local/lib:" -cp "/usr/local/lib/beast.jar" dr.app.beast.BeastMain \
    -beagle_GPU \
    -working \
    <my-xml> \
    > beast.out
```

### Docker

```bash
docker run --gpus all --mount type=bind,source=$PWD,target=/. jklaps/beast-beagle-cuda:latest \
    java -Xms8g -Xprof -Xmx32g -Dbeast.plugins.dir="/usr/local/plugins/" -Djava.library.path="/usr/local/lib:" -cp "/usr/local/lib/beast.jar" dr.app.beast.BeastMain \
    -beagle_GPU \
    -working \
    <my-xml> \
    > beast.out
```
