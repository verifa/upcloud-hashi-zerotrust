# TODO: bootstrap the Terraform Cloud Workspaces

locals {
  workspace_prefix = "ucvzt" # Madeup: UpCloud-Verifa-Zero-Trust
  workspace_tags   = ["verifa", "upcloud", "zero-trust"]

  workspaces = {
    bootstrap = {
      working_directory = "workspaces/bootstrap"
      tags              = ["bootstrap"]
    }
  }
}

resource "tfe_workspace" "this" {
  for_each = local.workspaces

  name           = "${local.workspace_prefix}-${each.key}"
  organization   = "verifa-io"
  execution_mode = "remote"
  tag_names      = concat(local.workspace_tags, each.value.tags)

  working_directory = each.value.working_directory
  vcs_repo {
    identifier     = "verifa/upcloud-hashi-zerotrust"
    branch         = "main"
    oauth_token_id = "ot-BrW4Jncm2Lx2rosU"
  }
}
