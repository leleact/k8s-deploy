# Gitlab on kubernetes

## install with `helm`
``` bash
helm install --name gitlab --namespace gitlab gitlab/gitlab -f values.yaml
```

## modify NodePort

``` bash
kubectl -n gitlab edit svc gitlab-nginx-ingress-controller
```

## change root password

enter `task-runner` pod
``` bash
gitlab-rails console production
user = User.where(id: 1).first
user.password = 'secret_pass'
user.password_confirmation = 'secret_pass'
user.save!
```
