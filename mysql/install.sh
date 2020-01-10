#! /usr/bin/env bash
helm install mysql stable/mysql --namespace mysql -f values.yaml
