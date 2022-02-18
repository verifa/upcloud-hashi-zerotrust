locals {
  app = yamldecode(file("../../live/apps.yml"))

  # flatten the yaml into a list of unique environments
  app_flat = flatten([
    for app_key, app in yamldecode(file("../../live/apps.yml")) : [
      for env_key, env in app : {
        application = app_key
        environment = env_key
        compute = env.compute
        database = env.database
      }
    ]
  ])

  # move the flat list items under identifiable name
  # example output (in yaml):
  #"dev/my_app1":
  #  "application": "my_app1"
  #  "environment": "dev"  
  #  "compute":
  #    "count": 1
  #    "size": "1xCPU-1GB"
  #  "database":
  #    "region": "fi-hel1"
  #    "size": "1x1xCPU-2GB-25GB"
  #    "type": "postgres"
  app_envs = { for env in local.app_flat : "${env.environment}/${env.application}" => {
    environment = env.environment
    application = env.application
    compute     = env.compute
    database    = env.database
  }}
}

# will be named like this in state: module.compute["dev/my_app1"]
module "compute" {
  for_each = local.app_envs
  source = "./modules/compute"

  inputs = each.value.compute
  env = each.value.environment
  app = each.value.application

  # could also share data between different type of resources if needed
  #db_type = each.value.database.type
}

module "database" {
  for_each = local.app_envs
  source = "./modules/database"

  inputs = each.value.database
  env = each.value.environment
  app = each.value.application

  # some values might be useful to pass explicitly, 
  # so they can also come from workspace vars etc.
  #size = var.default_db_size
}

output "app_envs" {
  value = local.app_envs
}

output "compute" {
  value = module.compute
}

output "database" {
  value = module.database
  sensitive = true
}
