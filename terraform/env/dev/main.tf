module "app" {
  source       = "../../app"
  environment  = var.environment
  project_name = var.project_name
  database_url = var.database_url
}

