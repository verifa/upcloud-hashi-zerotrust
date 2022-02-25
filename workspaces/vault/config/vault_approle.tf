
resource "vault_auth_backend" "this" {
  type = "approle"
}

resource "vault_approle_auth_backend_role" "this" {
  backend        = vault_auth_backend.this.path
  role_name      = "tfc" # Terraform Cloud role
  token_policies = [vault_policy.admin.name]
}
