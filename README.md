# Local Cloud Docker Terraform Project

This project uses **Terraform** to provision a local development
environment powered by **Docker**, including a backend, frontend, and
database container running on a shared Docker network.

## Features

-   Automated infrastructure setup using Terraform.
-   Docker-based microservice layout.
-   Custom Docker network for isolated communication.
-   Easy teardown and redeployment.

## Project Structure

    network/
      main.tf        # Defines the docker_network resource
    docker/
      backend/
      frontend/
      db/

## Usage

### 1. Initialize Terraform

``` bash
terraform init
```

### 2. Apply the Infrastructure

``` bash
terraform apply -auto-approve
```

### 3. Destroy the Environment

If the network fails to delete, ensure all containers using it are
removed:

``` bash
docker ps
docker rm -f <container>
terraform destroy
```

## Common Errors

### ❗ Network has active endpoints

If you see:

    Error response from daemon: error while removing network: network local_cloud has active endpoints

It means containers are still attached. Remove them manually:

``` bash
docker rm -f backend frontend db
terraform destroy
```

## License

MIT License