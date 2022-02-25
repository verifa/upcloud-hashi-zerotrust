
terraform {
  cloud {
    organization = "verifa-io"

    workspaces {
      name = "{{ .Variables.workspace_prefix }}-{{ .Variables.workspace_name }}"
    }
  }
}
