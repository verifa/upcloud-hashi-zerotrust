provider "vault" {
  # Credentials provided with env vars
  # VAULT_ADDR
  # VAULT_TOKEN
  # for HCP:
  # VAULT_NAMESPACE
}

terraform {
  required_providers {
    upcloud = {
      source  = "UpCloudLtd/upcloud"
    }
  }
}

provider "upcloud" {
  # Credentials provided with env vars
  # UPCLOUD_USERNAME
  # UPCLOUD_PASSWORD
}
