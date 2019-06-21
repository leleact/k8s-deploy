#!/usr/bin/env bash

curl https://get.helm.sh/helm-v2.14.1-linux-amd64.tar.gz -o helm-v2.14.1-linux-amd64.tar.gz
tar -xf helm-v2.14.1-linux-amd64.tar.gz
cd linux-amd64
mv helm /usr/local/bin/

docker pull registry.cn-hangzhou.aliyuncs.com/google_containers/tiller:v2.14.1
docker tag registry.cn-hangzhou.aliyuncs.com/google_containers/tiller:v2.14.1 gcr.io/kubernetes-helm/tiller:v2.14.1
docker rmi registry.cn-hangzhou.aliyuncs.com/google_containers/tiller:v2.14.1

kubectl create serviceaccount --namespace kube-system tiller
kubectl create clusterrolebinding tiller-cluster-rule --clusterrole=cluster-admin --serviceaccount=kube-system:tiller
helm init --upgrade
kubectl patch deploy --namespace kube-system tiller-deploy -p '{"spec":{"template":{"spec":{"serviceAccount":"tiller"}}}}'

helm repo add stable http://mirror.azure.cn/kubernetes/charts/
helm repo add incubator http://mirror.azure.cn/kubernetes/charts-incubator/
