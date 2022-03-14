
locals {
  servers = {
    infra = {
      image     = "01000000-0000-4000-8000-000030200200"
      disk_size = 25
      region    = "fi-hel1"
      plan      = "1xCPU-1GB"
    }
    app-x = {
      image     = "01000000-0000-4000-8000-000030200200"
      disk_size = 25
      region    = "fi-hel1"
      plan      = "1xCPU-1GB"
    }
  }
}


module "compute" {
  for_each = local.servers
  source   = "../../../../modules/compute"

  project     = var.project
  environment = var.environment

  server = merge(
    {
      name = each.key
    },
    each.value
  )
}

