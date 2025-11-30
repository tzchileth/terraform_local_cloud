resource "docker_image" "backend" {
  build {
    context = "${path.module}/app"
  }
  name = "local_backend:latest"
}

resource "docker_container" "backend" {
  name  = "backend"
  image = docker_image.backend.name

  networks_advanced {
    name    = var.network_name
    aliases = ["backend"]
  }

  ports {
    internal = 5000
  }

  env = [
    "POSTGRES_PASSWORD=${var.db_password}"
  ]

  restart = "on-failure"
}
