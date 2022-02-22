
provider "tfe" {
  token = vault_generic_secret.tfc.data.token
}

provider "vault" {
  address   = var.vault_address
  token     = hcp_vault_cluster_admin_token.zerotrust_vault_admin_token.token
  namespace = var.vault_admin_namespace
}
