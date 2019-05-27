## install
``` bash
kubectl apply -f https://raw.githubusercontent.com/kubernetes/dashboard/v1.10.1/src/deploy/recommended/kubernetes-dashboard.yaml
kubectl create -f admin-user.yaml
kubectl create -f admin-user-role-binding.yaml
```
