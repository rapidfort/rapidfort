[![Rapidfort](https://assets.website-files.com/6102f7f1589f985b19197b3d/61082629d82d1361e5835b58_rapidfort_logo-new.svg)](https://rapidfort.com)
# RapidFort Helm Repository

Welcome to RapidFort! Get ready to optimize and secure your cloud.

## Quickstart Guide

### Prerequisites
Before getting started, you will need the following:

1. Kubernetes Cluster version 1.20+
2. Helm version 3.0.0+
3. NGINX Ingress Controller and Network Load Balancer
    * For more information, please refer to [Ingress](#ingress)
4. Amazon Web Services (AWS) account
    * S3 Bucket for RapidFort data
    * IAM User with Read/Write/List permissions for the S3 bucket
        * Access Key ID
        * Secret Access Key

### AWS Resources
RapidFort needs an S3 bucket and an IAM user and policy with Read/List/Write permissions for the S3 bucket.

1. Create an S3 bucket in the same region in which RapidFort will be deployed (e.g. <code>rapidfort-s3</code>).
2. Create an IAM user (e.g. <code>rapidfort-user</code>). Generate and download an Access Key ID and Secret Access Key.
3. Create an IAM policy that gives Read/List/Write permissions for the RapidFort S3 bucket using the sample JSON code.
   ```json
   {
      "Version": "2012-10-17",
      "Statement": [
        {
          "Sid": "VisualEditor0",
          "Effect": "Allow",
          "Action": [
            "s3:DeleteObject",
            "s3:PutObject",
            "s3:GetObject",
            "s3:DescribeJob",
            "s3:ListBucket"
          ],
          "Resource": [
            "<S3_BUCKET_ARN>",
            "<S3_BUCKET_ARN>/*"
          ]
        }
      ]
   }
   ```
   **Example: AWS Commercial**
   ```json
   {
      "Version": "2012-10-17",
      "Statement": [
        {
          "Sid": "VisualEditor0",
          "Effect": "Allow",
          "Action": [
            "s3:DeleteObject",
            "s3:PutObject",
            "s3:GetObject",
            "s3:DescribeJob",
            "s3:ListBucket"
          ],
          "Resource": [
            "arn:aws:s3:::rapidfort-s3",
            "arn:aws:s3:::rapidfort-s3/*"
          ]
        }
      ]
   }
   ```
   **Example: AWS GovCloud**
   ```json
   {
      "Version": "2012-10-17",
      "Statement": [
        {
          "Sid": "VisualEditor0",
          "Effect": "Allow",
          "Action": [
            "s3:DeleteObject",
            "s3:PutObject",
            "s3:GetObject",
            "s3:DescribeJob",
            "s3:ListBucket"
          ],
          "Resource": [
            "arn:aws-gov:s3:::rapidfort-s3",
            "arn:aws-gov:s3:::rapidfort-s3/*"
          ]
        }
      ]
   }
   ```
4. Attach the policy to the IAM user.

### Deploy RapidFort
1. Clone the GitHub RapidFort repository.
2. Update <code>values.yaml</code> with your deployment information. For more information, please refer to [Parameters](#parameters).
3. Run the following command to install RapidFort:
   ```
   helm upgrade --install rapidfort ./ -f values.yaml -n <namespace>
   ```
   For example, if you would like to deploy RapidFort in the <code>rapidfort</code> namespace:
   ```
   helm upgrade --install rapidfort ./ -f values.yaml -n rapidfort
   ```
4. Wait for a RapidFort welcome email. This will contain a link to the RapidFort dashboard.
5. Visit the RapidFort dashboard. You will be guided through the process for contacting RapidFort Support to request a license.

For more information, please refer to the [RapidFort user documentation](https://docs.rapidfort.com/rapidfort-on-premises/helm-chart-aws).

## Parameters

### Global parameters

| Name                      | Description                                                    | Value           |
| ------------------------- | -------------------------------------------------------------- | --------------- |
| `global.rf_app_host`      | Public RapidFort service endpoint (FQDN or IP)    | `""`            |
| `global.ingressClassName` | Ingress class name                                             | `""`            |

### Common parameters

| Name                            | Description                                                                                 | Value           | Required |
| ------------------------------- | ------------------------------------------------------------------------------------------- | --------------- | -------- |
| `secret.aws_access_key_id`                        | AWS credentials with Read/List/Write permissions for the RapidFort S3 bucket                | `""`            | `false`   |
| `secret.aws_secret_access_key`                    | AWS credentials with Read/List/Write permissions for the RapidFort S3 bucket                | `""`            | `false`   |
| `secret.aws_secret_access_key`                    | AWS IAM Role with Read/List/Write permissions for the RapidFort S3 bucket                | `""`            | `false`   |
| `secret.aws_default_region`                       | AWS region                                                                | `""`            | `true`   |
| `secret.s3_bucket`                                | AWS S3 bucket for Rapidfort data                                     | `""`            | `true`   |
| `secret.rf_app_admin`                             | RapidFort application admin email address                                 | `""`            | `true`   |
| `secret.rf_app_admin_passwd`                      | RapidFort application admin password             | `""`            | `true`   |
| `secret.rf_app_host`                              | Public RapidFort service endpoint (FQDN or IP)   | `""`            | `true`   |

## Ingress
### NGINX Ingress Controller
Create an [NGINX Ingress Controller](https://github.com/kubernetes/ingress-nginx/blob/main/docs/deploy/index.md) deployment using the sample YAML code.
```
apiVersion: v1
kind: Namespace
metadata:
  name: ingress-nginx
  labels:
    app.kubernetes.io/name: ingress-nginx
    app.kubernetes.io/part-of: ingress-nginx

---

kind: ConfigMap
apiVersion: v1
metadata:
  name: nginx-configuration
  namespace: ingress-nginx
  labels:
    app.kubernetes.io/name: ingress-nginx
    app.kubernetes.io/part-of: ingress-nginx
data:
  proxy-connect-timeout: "300"
  proxy-read-timeout: "3600"
  proxy-send-timeout: "3600"
  use-proxy-protocol: "false"
  use-forwarded-headers: "true"
  proxy-real-ip-cidr: "0.0.0.0/0"
---
kind: ConfigMap
apiVersion: v1
metadata:
  name: tcp-services
  namespace: ingress-nginx
  labels:
    app.kubernetes.io/name: ingress-nginx
    app.kubernetes.io/part-of: ingress-nginx

---
kind: ConfigMap
apiVersion: v1
metadata:
  name: udp-services
  namespace: ingress-nginx
  labels:
    app.kubernetes.io/name: ingress-nginx
    app.kubernetes.io/part-of: ingress-nginx

---
apiVersion: v1
kind: ServiceAccount
metadata:
  name: nginx-ingress-serviceaccount
  namespace: ingress-nginx
  labels:
    app.kubernetes.io/name: ingress-nginx
    app.kubernetes.io/part-of: ingress-nginx

---
apiVersion: rbac.authorization.k8s.io/v1beta1
kind: ClusterRole
metadata:
  name: nginx-ingress-clusterrole
  labels:
    app.kubernetes.io/name: ingress-nginx
    app.kubernetes.io/part-of: ingress-nginx
rules:
  - apiGroups:
      - ""
    resources:
      - configmaps
      - endpoints
      - nodes
      - pods
      - secrets
    verbs:
      - list
      - watch
  - apiGroups:
      - ""
    resources:
      - nodes
    verbs:
      - get
  - apiGroups:
      - ""
    resources:
      - services
    verbs:
      - get
      - list
      - watch
  - apiGroups:
      - ""
    resources:
      - events
    verbs:
      - create
      - patch
  - apiGroups:
      - "extensions"
      - "networking.k8s.io"
    resources:
      - ingresses
    verbs:
      - get
      - list
      - watch
  - apiGroups:
      - "extensions"
      - "networking.k8s.io"
    resources:
      - ingresses/status
    verbs:
      - update

---
apiVersion: rbac.authorization.k8s.io/v1beta1
kind: Role
metadata:
  name: nginx-ingress-role
  namespace: ingress-nginx
  labels:
    app.kubernetes.io/name: ingress-nginx
    app.kubernetes.io/part-of: ingress-nginx
rules:
  - apiGroups:
      - ""
    resources:
      - configmaps
      - pods
      - secrets
      - namespaces
    verbs:
      - get
  - apiGroups:
      - ""
    resources:
      - configmaps
    resourceNames:
      # Defaults to "<election-id>-<ingress-class>"
      # Here: "<ingress-controller-leader>-<nginx>"
      # This has to be adapted if you change either parameter
      # when launching the nginx-ingress-controller.
      - "ingress-controller-leader-nginx"
    verbs:
      - get
      - update
  - apiGroups:
      - ""
    resources:
      - configmaps
    verbs:
      - create
  - apiGroups:
      - ""
    resources:
      - endpoints
    verbs:
      - get

---
apiVersion: rbac.authorization.k8s.io/v1beta1
kind: RoleBinding
metadata:
  name: nginx-ingress-role-nisa-binding
  namespace: ingress-nginx
  labels:
    app.kubernetes.io/name: ingress-nginx
    app.kubernetes.io/part-of: ingress-nginx
roleRef:
  apiGroup: rbac.authorization.k8s.io
  kind: Role
  name: nginx-ingress-role
subjects:
  - kind: ServiceAccount
    name: nginx-ingress-serviceaccount
    namespace: ingress-nginx

---
apiVersion: rbac.authorization.k8s.io/v1beta1
kind: ClusterRoleBinding
metadata:
  name: nginx-ingress-clusterrole-nisa-binding
  labels:
    app.kubernetes.io/name: ingress-nginx
    app.kubernetes.io/part-of: ingress-nginx
roleRef:
  apiGroup: rbac.authorization.k8s.io
  kind: ClusterRole
  name: nginx-ingress-clusterrole
subjects:
  - kind: ServiceAccount
    name: nginx-ingress-serviceaccount
    namespace: ingress-nginx

---

apiVersion: apps/v1
kind: Deployment
metadata:
  name: nginx-ingress-controller
  namespace: ingress-nginx
  labels:
    app.kubernetes.io/name: ingress-nginx
    app.kubernetes.io/part-of: ingress-nginx
spec:
  replicas: 1
  selector:
    matchLabels:
      app.kubernetes.io/name: ingress-nginx
      app.kubernetes.io/part-of: ingress-nginx
  template:
    metadata:
      labels:
        app.kubernetes.io/name: ingress-nginx
        app.kubernetes.io/part-of: ingress-nginx
      annotations:
        prometheus.io/port: "10254"
        prometheus.io/scrape: "true"
    spec:
      # wait up to five minutes for the drain of connections
      terminationGracePeriodSeconds: 300
      serviceAccountName: nginx-ingress-serviceaccount
      nodeSelector:
        kubernetes.io/os: linux
      containers:
        - name: nginx-ingress-controller
          image: quay.io/kubernetes-ingress-controller/nginx-ingress-controller:0.30.0
          args:
            - /nginx-ingress-controller
            - --configmap=$(POD_NAMESPACE)/nginx-configuration
            - --tcp-services-configmap=$(POD_NAMESPACE)/tcp-services
            - --udp-services-configmap=$(POD_NAMESPACE)/udp-services
            - --publish-service=$(POD_NAMESPACE)/ingress-nginx
            - --annotations-prefix=nginx.ingress.kubernetes.io
          securityContext:
            allowPrivilegeEscalation: true
            capabilities:
              drop:
                - ALL
              add:
                - NET_BIND_SERVICE
            # www-data -> 101
            runAsUser: 101
          env:
            - name: POD_NAME
              valueFrom:
                fieldRef:
                  fieldPath: metadata.name
            - name: POD_NAMESPACE
              valueFrom:
                fieldRef:
                  fieldPath: metadata.namespace
          ports:
            - name: http
              containerPort: 80
              protocol: TCP
            - name: https
              containerPort: 443
              protocol: TCP
          livenessProbe:
            failureThreshold: 3
            httpGet:
              path: /healthz
              port: 10254
              scheme: HTTP
            initialDelaySeconds: 10
            periodSeconds: 10
            successThreshold: 1
            timeoutSeconds: 10
          readinessProbe:
            failureThreshold: 3
            httpGet:
              path: /healthz
              port: 10254
              scheme: HTTP
            periodSeconds: 10
            successThreshold: 1
            timeoutSeconds: 10
          lifecycle:
            preStop:
              exec:
                command:
                  - /wait-shutdown

---

apiVersion: v1
kind: LimitRange
metadata:
  name: ingress-nginx
  namespace: ingress-nginx
  labels:
    app.kubernetes.io/name: ingress-nginx
    app.kubernetes.io/part-of: ingress-nginx
spec:
  limits:
  - min:
      memory: 90Mi
      cpu: 100m
    type: Container
```

### Network Load Balancer
Create a [Network Load Balancer](https://aws.amazon.com/elasticloadbalancing/network-load-balancer/) using the sample YAML code.
```
kind: Service
apiVersion: v1
metadata:
  name: ingress-nginx-nlb
  namespace: ingress-nginx
  labels:
    app.kubernetes.io/name: ingress-nginx
    app.kubernetes.io/part-of: ingress-nginx
  annotations:
    # Uncomment below line by replacing with the correct value of the generated certificate in the AWS console
    #service.beta.kubernetes.io/aws-load-balancer-ssl-cert: "<AWS ARN for SSL Cert>"
    # the backend instances are HTTP
    service.beta.kubernetes.io/aws-load-balancer-backend-protocol: "http"
    # Map port 443
    service.beta.kubernetes.io/aws-load-balancer-ssl-ports: "https"
    # Ensure the ELB idle timeout is less than nginx keep-alive timeout. By default,
    # NGINX keep-alive is set to 75s. If using WebSockets, the value will need to be
    # increased to '3600' to avoid any potential issues.
    service.beta.kubernetes.io/aws-load-balancer-connection-idle-timeout: "3600"
    service.beta.kubernetes.io/aws-load-balancer-type: nlb
spec:
  type: LoadBalancer
  selector:
    app.kubernetes.io/name: ingress-nginx
    app.kubernetes.io/part-of: ingress-nginx
  ports:
    - name: rf-http
      port: 80
      protocol: TCP
      targetPort: http
    - name: https
      port: 443
      protocol: TCP
      targetPort: http
```

## Uninstall RapidFort
To uninstall RapidFort, run the following command:
```
helm uninstall rapidfort -n <namespace>
```
For example, if you deployed RapidFort using the <code>rapidfort</code> namespace:
```
helm uninstall rapidfort -n rapidfort
```
