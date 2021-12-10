#!/bin/bash

kubectl create namespace hpa-prometheus

kubectl -n hpa-prometheus apply -f php-apache.yaml

#kubectl -n hpa-prometheus autoscale deployment php-apache --cpu-percent=50 --min=1 --max=10

kubectl -n hpa-prometheus get hpa
