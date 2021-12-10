#!/bin/bash

kubectl -n hpa-prometheus port-forward `kubectl -n hpa-prometheus get pods | grep php-apache | awk '{print $1}'` 3000:80
