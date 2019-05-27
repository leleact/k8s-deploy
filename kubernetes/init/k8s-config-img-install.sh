#! /usr/bin/env bash

images=$(kubeadm config images list| awk -F '/' '{ print $2 }')
images+=(kubernetes-dashboard-amd64:v1.10.1)

for imageName in ${images[@]} ; do
    docker pull registry.cn-hangzhou.aliyuncs.com/google_containers/$imageName
    docker tag registry.cn-hangzhou.aliyuncs.com/google_containers/$imageName k8s.gcr.io/$imageName
    docker rmi registry.cn-hangzhou.aliyuncs.com/google_containers/$imageName
done
