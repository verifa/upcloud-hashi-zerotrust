terraform {
  required_providers {
    upcloud = {
      source  = "UpCloudLtd/upcloud"
      version = "~> 2.2.0"
    }
    vault = {
      source  = "vault"
      version = "~> 3.3.0"
    }
  }
}
