terraform {
  extra_arguments "common_vars" {
    commands = ["plan", "apply"]
  }
}

generate "provider" {
    path = "provider.tf"
    if_exists = "overwrite_terragrunt"
    contents = <<EOF
terraform {
  required_providers {
    doppler = {
      source = "DopplerHQ/doppler"
      version = "1.1.6"
    }
  }
}
provider "doppler" {
    doppler_token = "${get_env("TF_VAR_doppler_token", "")}"
}
EOF
}

inputs = {
  environment = "${path_relative_to_include()}"
}

generate "variables" {
  path = "variables.tf"
  if_exists = "overwrite_terragrunt"
  contents = <<EOF
variable "environment" {
  type   = string
}

variable "project_name" {
  type = string
}

variable "database_url" {
  type = string
}
EOF
}
