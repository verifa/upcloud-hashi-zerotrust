
provider "hcp" {}

provider "vault" {
  address   = data.terraform_remote_state.vault_infra.outputs.vault_public_endpoint_url
  token     = hcp_vault_cluster_admin_token.zerotrust_vault_admin_token.token
  namespace = "admin"
}
