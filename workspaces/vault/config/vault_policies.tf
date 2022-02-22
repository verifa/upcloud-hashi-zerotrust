
resource "vault_policy" "admin" {
  provider = vault
  name     = "admins"
  policy   = file("policies/admin-policy.hcl")
}
