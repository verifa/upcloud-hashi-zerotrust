
# 
# Create Terraform Cloud backend to auto-generate tokens
# 
resource "vault_terraform_cloud_secret_backend" "this" {
  backend     = "tfc"
  description = "Manages the Terraform Cloud backend for generating auth tokens"
  token       = "TODO"
}
