## show example values.yaml
``` bash
helm inspect values stable/jenkins
```

## output deploy yaml
``` bash
helm install --name jenkins --namespace dev-ops -f values.yaml stable/jenkins --dry-run --debug
```

## install jenkins use helm
``` bash
helm install --name jenkins --namespace dev-ops -f values.yaml stable/jenkins
```

## jenkins plugin center
```
https://updates.jenkins.io/download/plugins
```
