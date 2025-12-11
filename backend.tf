# Use the TF_TOKEN_app_terraform_io to set a User Token to authenticate with HCP Terraform.

terraform {
  cloud {
    organization = "UPDATE_ME"

    workspaces {
      project = "UPDATE_ME"
      name    = "UPDATE_ME"
    }
  }
}
