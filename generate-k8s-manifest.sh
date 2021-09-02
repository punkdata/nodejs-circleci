#!/bin/bash 
set -o pipefail

APP_NAME=$1 #Name of the app
IMAGE_NAME=$2 #Tag for image

cat << EOF > k8s-deployment.yaml
---
apiVersion: "apps/v1"
kind: "Deployment"
metadata:
  name: "$APP_NAME"
  namespace: "default"
  labels:
    app: "$APP_NAME"
spec:
  replicas: 3
  selector:
    matchLabels:
      app: "$APP_NAME"
  template:
    metadata:
      labels:
        app: "$APP_NAME"
    spec:
      containers:
      - name: "$APP_NAME"
        image: "$IMAGE_NAME"
---
apiVersion: "autoscaling/v2beta1"
kind: "HorizontalPodAutoscaler"
metadata:
  name: "$APP_NAME-hpa-ndyl"
  namespace: "default"
  labels:
    app: "$APP_NAME"
spec:
  scaleTargetRef:
    kind: "Deployment"
    name: "$APP_NAME"
    apiVersion: "apps/v1"
  minReplicas: 1
  maxReplicas: 5
  metrics:
  - type: "Resource"
    resource:
      name: "cpu"
      targetAverageUtilization: 80
---
apiVersion: "v1"
kind: "Service"
metadata:
  name: "$APP_NAME-service"
  namespace: "default"
  labels:
    app: "$APP_NAME"
spec:
  ports:
  - protocol: "TCP"
    port: 80
    targetPort: 5000
  selector:
    app: "$APP_NAME"
  type: "LoadBalancer"
  loadBalancerIP: ""
EOF