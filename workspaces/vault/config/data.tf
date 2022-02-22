
data "terraform_remote_state" "vault_infra" {
  backend = "remote"

  config = {
    organization = "verifa-io"
    workspaces = {
      name = "upcloud-hashi-zerotrust-vault-infra"
    }
  }
}

data "vault_generic_secret" "tfc" {
  path = "secrets/tfc/jlarfors"
}
