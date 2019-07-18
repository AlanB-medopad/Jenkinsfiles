# Sample Code for Docker and Terraform and Python and flask

## overview

Show conatiner's hostname + MYSQL command

##### Requirements
The following commands should work on your system:

- terraform
- docker

### How to deploy

#### Terraform

The following resources are managed with Terraform and should be deployed before docker.


All Terraform states are deployed by executing the following commands in the state directory:
```
terraform init
terraform plan
terraform apply
```

1. **RDS KMS customer master key (CMK)**: `backend/aws/terraform/<account>/rds-kms.<region>`

We create one KMS CMK per region and account for the test app.

The key alias is always `alias/backend/test`.

2. **RDS graph database cluster**: `backend/aws/terraform/<account>/rds-cluster.<region>`

We create one RDS per region and account for the Patient Monitoring app.


Docker configuration 
### build

```
docker build --tag=hostnameimage .
```

### local

```
docker run -d -p80:80 --name=web hostnameimage
```

### cluster

```
docker swarm init
docker stack deploy -c docker-compose.yml hostnameimage

```