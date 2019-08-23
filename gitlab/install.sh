#!/usr/bin/env sh
helm install --name gitlab --namespace gitlab gitlab/gitlab -f values.yaml
