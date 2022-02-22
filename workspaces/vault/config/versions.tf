
terraform {
  required_providers {
    hcp = {
      version = "~> 0.22"
    }
    vault = {
      source  = "vault"
      version = "~> 3.3.0"
    }
  }
}
