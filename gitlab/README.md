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
kubectl exec -it -n gitlab $(kubectl get po -l release=gitlab,app=task-runner -n gitlab | grep runner | awk '{ print $1 }') -- bash
```

change root passwd
``` bash
gitlab-rails console production
user = User.where(id: 1).first
user.password = 'secret_pass'
user.password_confirmation = 'secret_pass'
user.save!
```
or

``` bash
/srv/gitlab/bin/rails runner "user = User.first; user.password='#{password}'; user.password_confirmation='#{password}'; user.save!"
```

## change ingress class
``` bash
kubectl -n gitlab edit ingress gitlab-unicorn
```

## Q&A

1. must enable https ? or login http 422 code
