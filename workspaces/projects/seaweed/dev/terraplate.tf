terraform {
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

variable "environment" {
  default = "prod"
}

variable "project" {
  default = "seaweed"
}

variable "vault_address" {
  default = "https://zerotrust-vault-cluster.vault.40d0f0a3-d875-40d1-8e9f-ce5b8ceb3404.aws.hashicorp.cloud:8200"
}

variable "vault_admin_namespace" {
  default = "admin"
}

