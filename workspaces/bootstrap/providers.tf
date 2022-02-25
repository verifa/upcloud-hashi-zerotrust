
# 
# TODO: cannot use this to authenticate with the tfe provider
# 
# resource "vault_terraform_cloud_secret_creds" "this" {
#   backend = "tfc"
#   role    = "tunaboat"
# }

#
# Get static secret to authenticate with TFC
# 
data "vault_generic_secret" "tfc" {
  path = "secrets/tfc/jlarfors"
}


provider "tfe" {
  token = data.vault_generic_secret.tfc.data.token
}

# TODO: cleanup
variable "vault_approle_role_id" {}
variable "vault_approle_secret_id" {}

provider "vault" {
  address   = var.vault_address
  namespace = var.vault_admin_namespace

  auth_login {
    path      = "auth/approle/login"
    namespace = var.vault_admin_namespace

    parameters = {
      role_id   = var.vault_approle_role_id
      secret_id = var.vault_approle_secret_id
    }
  }
}
