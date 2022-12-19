include .env

ENV=$(env)

deps: node_modules
	yarn install

infra:
		@echo "Terraform init"
		@cd terraform/env/$(ENV) && terragrunt init
		@echo "Terragrunt"
		@cd terraform/env/$(ENV) && TF_VAR_doppler_token=$(TF_VAR_doppler_token) \
																TF_VAR_database_url=$(TF_VAR_database_url) \
																TF_VAR_project_name=$(TF_VAR_project_name) \
																terragrunt apply
