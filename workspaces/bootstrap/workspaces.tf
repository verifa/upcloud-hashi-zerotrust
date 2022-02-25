# TODO: bootstrap the Terraform Cloud Workspaces

locals {
  workspace_prefix = "ucvzt" # Madeup: UpCloud-Verifa-Zero-Trust
  workspace_tags   = ["verifa", "upcloud", "zero-trust"]

  workspaces = {
    project-seaweed-prod = {
      working_directory = "workspaces/projects/seaweed/prod"
      tags              = ["seaweed", "prod"]
    }
    project-seaweed-dev = {
      working_directory = "workspaces/projects/seaweed/dev"
      tags              = ["seaweed", "dev"]
    }
  }
}

resource "tfe_workspace" "this" {
  for_each = local.workspaces

  name           = "${local.workspace_prefix}-${each.key}"
  organization   = "verifa-io"
  execution_mode = "remote"
  auto_apply     = true
  tag_names      = concat(local.workspace_tags, each.value.tags)

  working_directory = each.value.working_directory
  vcs_repo {
    identifier     = "verifa/upcloud-hashi-zerotrust"
    branch         = "main"
    oauth_token_id = "ot-BrW4Jncm2Lx2rosU"
  }
}

resource "tfe_variable" "vault_approle_role_id" {
  for_each = tfe_workspace.this

  key          = "vault_approle_role_id"
  value        = var.vault_approle_role_id
  category     = "terraform"
  workspace_id = each.value.id
  description  = "Vault AppRole Role ID to authenticate with Vault"
  sensitive    = true
}

resource "tfe_variable" "vault_approle_secret_id" {
  for_each = tfe_workspace.this

  key          = "vault_approle_secret_id"
  value        = var.vault_approle_secret_id
  category     = "terraform"
  workspace_id = each.value.id
  description  = "Vault AppRole Secret ID to authenticate with Vault"
  sensitive    = true
}
