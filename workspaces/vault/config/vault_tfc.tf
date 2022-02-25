
# 
# Create Terraform Cloud backend to auto-generate tokens
# 
resource "vault_terraform_cloud_secret_backend" "this" {
  backend     = "tfc"
  description = "Manages the Terraform Cloud backend for generating auth tokens"
  token       = data.vault_generic_secret.tfc.data.token
}

resource "vault_terraform_cloud_secret_role" "this" {
  backend      = vault_terraform_cloud_secret_backend.this.backend
  name         = "tunaboat"
  organization = "verifa-io"
  max_ttl      = 1200 # Seconds
  ttl          = 600  # Seconds
}

