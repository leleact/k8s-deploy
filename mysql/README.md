# Mysql Heml chart install

## Instll
``` bash
helm install stable/mysql --name mysql --namespace mysql -f values.yaml
```
## apply pv
``` yaml
apiVersion: v1
kind: PersistentVolume
metadata:
  name: mysql
  labels:
    app: mysql
    type: local
spec:
  storageClassName: ""
  capacity:
    storage: 1Gi
  accessModes:
    - ReadWriteOnce
  persistentVolumeReclaimPolicy: Retain
  hostPath:
    path: /mnt/k8s/mysql
```
