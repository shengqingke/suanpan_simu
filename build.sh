#!/bin/bash

set -x

image=mdo-sim
tag=0.0.1
front_version=0.0.83
registry=registry.cn-shanghai.aliyuncs.com/shuzhi-amd64
repo=${registry}/${image}:${tag}

docker build --build-arg FRONT_VERSION=$front_version -t ${repo} .
docker push ${repo}