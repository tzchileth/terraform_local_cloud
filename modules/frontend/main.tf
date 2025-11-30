resource "docker_image" "nginx" {
  name = "nginx:latest"
}

resource "docker_container" "frontend" {
  name  = "frontend"
  image = docker_image.nginx.name

  ports {
    internal = 80
    external = var.host_port
  }

  volumes {
    host_path      = abspath("${path.module}/nginx.conf")
    container_path = "/etc/nginx/conf.d/default.conf"
    read_only      = true
  }

  networks_advanced {
    name = var.network_name
  }

  restart = "on-failure"
}
