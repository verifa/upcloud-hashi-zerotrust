
resource "hcp_vault_cluster_admin_token" "zerotrust_vault_admin_token" {
  cluster_id = data.terraform_remote_state.vault_infra.outputs.vault_cluster_id
}
