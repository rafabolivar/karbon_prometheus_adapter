#!/bin/bash

helm repo add prometheus-community https://prometheus-community.github.io/helm-charts --force-update
helm repo update
helm install -n prometheus-adapter karbon prometheus-community/prometheus-adapter --create-namespace -f /home/ubuntu/prometheus/scripts/prometheus-adapter-values.yaml
