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

variable "environment" {
  default = "env"
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

variable "vault_approle_role_id" {
  default = ""
}

variable "vault_approle_secret_id" {
  default = ""
}

variable "workspace_name" {
  default = "project-seaweed-dev"
}

variable "workspace_prefix" {
  default = "ucvzt"
}

