module "network" {
  source = "./modules/network"
  name   = "local_cloud"
}

module "database" {
  source       = "./modules/database"
  network_name = module.network.network_name
  db_password  = var.postgres_password
}


module "backend" {
  source       = "./modules/backend"
  network_name = module.network.network_name
  db_password  = var.postgres_password
}

module "frontend" {
  source        = "./modules/frontend"
  network_name  = module.network.network_name
  host_port     = var.frontend_host_port
  backend_alias = "backend"
}
