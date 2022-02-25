
terraform {
  cloud {
    organization = "verifa-io"

    workspaces {
      name = "ucvzt-bootstrap"
    }
  }
}
