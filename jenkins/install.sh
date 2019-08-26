#!/usr/bin/env sh
helm install --name jenkins --namespace dev-ops -f values.yaml stable/jenkins
