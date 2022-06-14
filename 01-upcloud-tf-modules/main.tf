terraform {
  required_providers {
    upcloud = {
      source = "UpCloudLtd/upcloud"
    }
  }
}

provider "upcloud" {}

module "compute" {
  source = "./modules/compute"

  project     = "project-x"
  environment = "dev"

  server = {
    name      = "my-server"
    image     = "Ubuntu Server 20.04 LTS (Focal Fossa)"
    disk_size = 25
    region    = "fi-hel1"
    plan      = "1xCPU-1GB"
  }
}

