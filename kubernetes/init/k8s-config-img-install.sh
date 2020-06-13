#! /usr/bin/env bash

images=$(kubeadm config images list| awk -F '/' '{ print $2 }')

#Azure_Mirror=gcr.azk8s.cn/google_containers
#Ali_Mirror=registry.cn-hangzhou.aliyuncs.com/google_containers
Mirror=registry.cn-hangzhou.aliyuncs.com/google_containers

for imageName in ${images[@]} ; do
    docker pull ${Mirror}/$imageName
    docker tag  ${Mirror}/$imageName k8s.gcr.io/$imageName
    docker rmi  ${Mirror}/$imageName
done
