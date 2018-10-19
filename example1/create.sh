#!/bin/bash

cat <<- 'EOF' > "mysql-deployment.yaml"
kind: Deployment
apiVersion: extensions/v1beta1
metadata:
  name: mysql
  labels:
    name: mysql-deployment
    app: demo
spec:
  replicas: 1
  # selector identifies the set of Pods that this
  # replication controller is responsible for managing
  selector:
    matchLabels:
     name: mysql
     role: mysqldb
     app: demo
  template:
    spec:
      containers:
        - name: mysql
          image: bencer/workshop-forensics-1-mysql
          ports:
            - containerPort: 3306
              name: mysql
          env:
          - name: MYSQL_ROOT_PASSWORD
            value: foobar
          - name: MYSQL_DATABASE
            value: employees
          - name: SYSDIG_AGENT_CONF
            value: 'app_checks: [{name: mysql, check_module: mysql, pattern: {comm: mysqld}, conf: { server: 127.0.0.1, user: root, pass: foobar }}]'
    metadata:
      labels:
        # Important: these labels need to match the selector above
        # The api server enforces this constraint.
        name: mysql
        role: mysqldb
        app: demo
EOF

cat <<- 'EOF' > "mysql-service.yaml"
apiVersion: v1
kind: Service
metadata: 
  labels: 
    name: mysql
  name: mysql
spec:
  clusterIP: "None"
  ports:
    - port: 3306
      targetPort: 3306
  selector:
    name: mysql 
    app: demo
    role: mysqldb
EOF

cat <<- EOF > "ping-deployment.yaml"
kind: Deployment
apiVersion: extensions/v1beta1
metadata:
  name: ping
  labels:
    name: ping-deployment
    app: demo
spec:
  replicas: 1
  # selector identifies the set of Pods that this
  # replication controller is responsible for managing
  selector:
    matchLabels:
     name: ping
     role: frontend
     app: demo
  template:
    spec:
      containers:
        - name: phpping
          image: bencer/workshop-forensics-1-phpping
          env:
          - name: DB_HOST
            value: mysql.ping.svc.cluster.local
          ports:
          - containerPort: 80
            name: phpping
    metadata:
      labels:
        # Important: these labels need to match the selector above
        # The api server enforces this constraint.
        name: ping
        role: frontend
        app: demo
EOF

cat <<- EOF > "ping-service.yaml"
apiVersion: v1
kind: Service
metadata: 
  labels: 
    name: ping
  name: ping
spec: 
  ports:
    - port: 80
      targetPort: 80
  selector:
    name: ping
    app: demo
    role: frontend
EOF

cat <<- EOF > "client-deployment.yaml"
apiVersion: v1
kind: Pod
metadata:
  name: client
spec:
  containers:
  - args:
    - sh
    - -c
    - while true; do curl www.google.com; sleep 30; done
    image: tutum/curl
    name: client
EOF

kubectl create namespace ping
kubectl create -f mysql-deployment.yaml --namespace=ping
kubectl create -f mysql-service.yaml --namespace=ping
kubectl create -f ping-deployment.yaml --namespace=ping
kubectl create -f ping-service.yaml --namespace=ping
kubectl create -f client-deployment.yaml --namespace=ping
rm mysql-deployment.yaml mysql-service.yaml ping-deployment.yaml ping-service.yaml
