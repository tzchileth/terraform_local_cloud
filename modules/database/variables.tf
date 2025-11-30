variable "network_name" {
  type = string
  description = "Docker network for the database container"
}

variable "db_password" {
  type = string
  description = "Postgres password"
}
