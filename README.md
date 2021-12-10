# Nutanix Karbon Horizontal Pod Autoscale using Prometheus Adapter

This example shows how to use [Kubernetes HPA](https://kubernetes.io/docs/tasks/run-application/horizontal-pod-autoscale/) with [Nutanix Karbon](https://www.nutanix.com/products/karbon).

For this purpose, I have developed a few scripts that will help you deploying [Kubernetes Metrics Server](https://github.com/kubernetes-sigs/metrics-server) latest version, create a simple php-apache deployment, and then enable HPA for this deployment.

# Scripts

##  **[1-Prometheus_Adapter_Install.sh](https://github.com/rafabolivar/karbon_prometheus_adapter/blob/main/scripts/1-Prometheus_Adapter_Install.sh)**

This script deploys the Prometheus Adapter using Helm, so you can collect resource metrics from Kubelets and expose them in Kubernetes apiserver through [Metrics API](https://github.com/kubernetes/metrics) for use by [Horizontal Pod Autoscaler](https://kubernetes.io/docs/tasks/run-application/horizontal-pod-autoscale/) and [Vertical Pod Autoscaler](https://github.com/kubernetes/autoscaler/tree/master/vertical-pod-autoscaler/).

## [2-HorizontalPodAutoscaling.sh](https://github.com/rafabolivar/karbon_prometheus_adapter/blob/main/scripts/2-HorizontalPodAutoscaling.sh)
This script creates a namespace called `hpa-prometheus` and a simple php-apache deployment. Then, it enables HPA for the deployment with a target CPU utilization set to 50% and a number of replicas between 1 and 10:


## [3-Port-Forward.sh](https://github.com/rafabolivar/karbon_prometheus_adapter/blob/main/scripts/3-Port-Forward.sh)

This script makes a port forward of our pod to localhost:3000.

## [4-IncreaseLoad.sh](https://github.com/rafabolivar/karbon_prometheus_adapter/blob/main/scripts/4-IncreaseLoad.sh)
This script generates load using apache utils:

    for a in `seq 1 50`; do ab -rSqd -c 200 -n 20000 127.0.0.1:3000/;done

# Prerequisites

You need a working Kubernetes cluster v1.19+, deployed with Nutanix Karbon. 


# Useful links

Here you have several links that can be useful to understand this example:

 - [Karbon and Metrics API: A Practical Guide by Tuxtof](https://www.nutanix.dev/2021/11/17/karbon-and-metrics-api-a-practical-guide/).
 - [Metrics Server installation on Nutanix Karbon example by Pipoe2h](https://github.com/pipoe2h/karbon/tree/main/metrics-server).
 - [Kubernetes Metrics Server on GitHub](https://github.com/kubernetes-sigs/metrics-server).
 - [Kubernetes Horizontal Pod Autoscale](https://kubernetes.io/docs/tasks/run-application/horizontal-pod-autoscale/).
