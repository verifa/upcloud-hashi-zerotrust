
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

#
# Get static secret to authenticate with UpCloud
# 
data "vault_generic_secret" "upcloud" {
  path = "secrets/upcloud/apiverifa"
}

provider "upcloud" {
  username = data.vault_generic_secret.upcloud.data.username
  password = data.vault_generic_secret.upcloud.data.password
}
