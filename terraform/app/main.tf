resource "doppler_project" "project" {
  name = var.project_name
}

resource "doppler_environment" "environment" {
  project = doppler_project.project.name
  slug = var.environment
  name = "Development"
}

resource "random_password" "password" {
  length           = 16
  special          = true
  override_special = "!#$%&*()-_=+[]{}<>:?"
}

resource "doppler_secret" "db_url" {
  project = doppler_project.project.name
  config = doppler_environment.environment.slug
  name = "DATABASE_URL"
  value = var.database_url
}

resource "doppler_service_token" "token" {
  project = doppler_project.project.name
  config = doppler_environment.environment.slug
  name = "${upper(var.environment)} ${var.project_name} service token"
  access = "read"
}
