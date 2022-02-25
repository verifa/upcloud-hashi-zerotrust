
terraform {
  cloud {
    organization = "verifa-io"

    workspaces {
      name = "ucvzt-project-seaweed-prod"
    }
  }
}
