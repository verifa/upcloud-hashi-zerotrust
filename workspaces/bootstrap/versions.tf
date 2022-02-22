
terraform {
  required_providers {
    tfe = {
      source  = "hashicorp/tfe"
      version = "~> 0.28.1"
    }
    vault = {
      source  = "vault"
      version = "~> 3.3.0"
    }
  }
}
