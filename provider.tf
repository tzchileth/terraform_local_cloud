terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = ">= 3.5.1"
    }
  }
}

provider "docker" {
  host = "unix:///var/run/docker.sock"
}
