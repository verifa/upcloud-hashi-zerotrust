
terraform {
  required_version = ">= 1.1.0"

  required_providers {
    upcloud = {
      source  = "UpCloudLtd/upcloud"
      version = "~> 2.2.0"
    }
    vault = {
      source  = "hashicorp/vault"
      version = "~> 3.3.0"
    }
  }
}

variables {
  # TFC should override these
  vault_approle_role_id   = ""
  vault_approle_secret_id = ""
}
