
resource "tfe_workspace" "this" {
  name           = "${var.prefix}-${var.workspace.name}"
  organization   = "verifa-io"
  execution_mode = "remote"
  tag_names      = var.workspace.tags

  working_directory = var.workspace.working_directory
  vcs_repo {
    identifier     = "verifa/upcloud-hashi-zerotrust"
    branch         = "main"
    oauth_token_id = "ot-BrW4Jncm2Lx2rosU"
  }
}

resource "tfe_variable" "this" {
  key          = "vault_approle_role_id"
  value        = "my_value_name"
  category     = "terraform"
  workspace_id = tfe_workspace.this.id
  description  = "Vault AppRole Role ID to authenticate with Vault"
  sensitive    = true
}

resource "tfe_variable" "this" {
  key          = "vault_approle_secret_id"
  value        = "my_value_name"
  category     = "terraform"
  workspace_id = tfe_workspace.this.id
  description  = "Vault AppRole Secret ID to authenticate with Vault"
  sensitive    = true
}
