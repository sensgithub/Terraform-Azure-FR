Scalable Web Application Infrastructure
This Terraform conf creates a scalable web application infrastructure on Azure with the following components:

# Virtual Network with public, web, and database subnets
# Application Load Balancer for traffic distribution
# Auto-scaling Virtual Machine Scale Set running Nginx
# Managed PostgreSQL database
# Proper network security groups
# Azure Monitor for infrastructure monitoring and alerting

1. Backend provisioning
```
az group create --name [Region] --location [Location]

# Create storage account
az storage account create \
  --resource-group [Region] \
  --name [Storage_ACC_Name] \
  --sku Standard_LRS \
  --encryption-services blob

# Create container
az storage container create \
  --name tfstate \
  --account-name [Storage_ACC_Name]

```
2. Using Terraform for deployment
```
terraform plan  # to run precheck of configuration
terraform apply # deployment to Azure
```

3. Post-Deployment result

```
❯ curl -i 135.225.32.153:80
HTTP/1.1 200 OK
Server: nginx/1.14.0 (Ubuntu)
Date: Thu, 13 Mar 2025 00:03:08 GMT
Content-Type: text/html
Content-Length: 612
Last-Modified: Wed, 12 Mar 2025 23:44:17 GMT
Connection: keep-alive
ETag: "67d21c51-264"
Accept-Ranges: bytes

<!DOCTYPE html>
<html>
<head>
<title>Welcome to nginx!</title>
<style>
    body {
        width: 35em;
        margin: 0 auto;
        font-family: Tahoma, Verdana, Arial, sans-serif;
    }
</style>
</head>
<body>
<h1>Welcome to nginx!</h1>
<p>If you see this page, the nginx web server is successfully installed and
working. Further configuration is required.</p>

<p>For online documentation and support please refer to
<a href="http://nginx.org/">nginx.org</a>.<br/>
Commercial support is available at
<a href="http://nginx.com/">nginx.com</a>.</p>

<p><em>Thank you for using nginx.</em></p>
</body>
</html>
```