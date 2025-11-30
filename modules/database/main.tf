resource "docker_image" "postgres" {
  name = "postgres:15"
}

resource "docker_container" "db" {
  name  = "db"
  image = docker_image.postgres.name

  env = [
    "POSTGRES_PASSWORD=${var.db_password}"
  ]

  networks_advanced {
    name    = var.network_name
    aliases = ["db"]
  }

  restart = "on-failure"
}
