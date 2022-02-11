resource "vault_github_auth_backend" "upcloud" {
  organization = "upcloudltd"
  path = "github_upcloud"
}

resource "vault_github_user" "upcloud_vtorhonen" {
  backend  = vault_github_auth_backend.upcloud.path
  user     = "vtorhonen"
  policies = [vault_policy.admin.name]
}

resource "vault_github_user" "upcloud_isarpila" {
  backend  = vault_github_auth_backend.upcloud.path
  user     = "isarpila"
  policies = [vault_policy.admin.name]
}

resource "vault_github_auth_backend" "verifa" {
  organization = "verifa"
  path = "github_verifa"
}

resource "vault_github_user" "verifa_jlarfors" {
  backend  = vault_github_auth_backend.verifa.path
  user     = "jlarfors"
  policies = [vault_policy.admin.name]
}

resource "vault_github_user" "upcloud_mike" {
  backend  = vault_github_auth_backend.verifa.path
  user     = "mike-vainio-verifa"
  policies = [vault_policy.admin.name]
}