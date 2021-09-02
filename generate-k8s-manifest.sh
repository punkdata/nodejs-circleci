#!/bin/bash 
set -o pipefail

APP_NAME=$1 #Name of the app
IMAGE_NAME=$2 #Name of Docker Image

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
        image: "ariv3ra/$IMAGE_NAME"
        ports:
        - containerPort: 5000
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