#! /usr/bin/env bash
helm install stable/mysql --name mysql --namespace mysql -f values.yaml
