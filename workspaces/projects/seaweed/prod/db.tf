
locals {
  dbs = {
    # Another made up name
    gulfweed = {
      plan = "1x1xCPU-2GB-25GB"
      zone = "fi-hel1"
      properties = {
        public_access = true
        ip_filter     = ["0.0.0.0/0"]
      }
    }
  }
}

module "postgres" {
  for_each = local.dbs
  source   = "../../../../modules/postgres"

  project     = var.project
  environment = var.environment

  db = merge(
    {
      name = each.key
    },
    each.value
  )
}
