variable "environment" {
  type = string
  description = "The environment to which the application should be deployed (dev,test,prod)"
}

variable "project_name" {
  type = string
  description = "The name of the project"
}


variable "database_url" {
  type = string
}
