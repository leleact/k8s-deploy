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

## initial root password
```
kubectl get secrets -n gitlab gitlab-gitlab-initial-root-password -o jsonpath={.data.password} | base64 -d
```

## gen tls
``` bash
openssl genrsa -out gitlab.centos.local.key 4096
openssl req -new -sha512 -key gitlab.centos.local.key -subj "/C=CN/ST=Shanghai/O=Local Gitlab, Inc./CN=gitlab.centos.local" -config ./openssl.cnf -out gitlab.centos.local.csr
openssl req -in gitlab.centos.local.csr -noout -text
openssl ca -in gitlab.centos.local.csr -md sha512 -keyfile cakey.pem -cert cacert.pem -days 365 -out gitlab.centos.local.crt  -config ./openssl.cnf
```

## change ingress class
``` bash
kubectl -n gitlab edit ingress gitlab-unicorn
```

## Q&A

1. must enable https ? or login http 422 code
