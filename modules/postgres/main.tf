
# 
# Create the managed Postgres DB
# 
resource "upcloud_managed_database_postgresql" "this" {
  name = var.db.name
  plan = var.db.plan
  zone = var.db.zone
  properties {
    public_access = var.db.properties.public_access
    ip_filter     = var.db.properties.ip_filter
  }
}

locals {
  connection_url = format(
    "postgres://%s:%s@public-%s:%s/defaultdb?sslmode=require",
    upcloud_managed_database_postgresql.this.service_username,
    upcloud_managed_database_postgresql.this.service_password,
    upcloud_managed_database_postgresql.this.service_host,
    upcloud_managed_database_postgresql.this.service_port
  )
}

# 
# Create secret backend for Vault
# 
resource "vault_database_secret_backend_connection" "this" {
  backend       = var.vault_mount_path
  name          = "upcloud-postgres"
  allowed_roles = ["admin-role"]

  postgresql {
    connection_url = local.connection_url
  }
}

# 
# Create role for secret backend for Vault
# 
resource "vault_database_secret_backend_role" "this" {
  backend             = var.vault_mount_path
  name                = "admin-role"
  db_name             = vault_database_secret_backend_connection.this.name
  creation_statements = ["CREATE ROLE \"{{name}}\" WITH LOGIN PASSWORD '{{password}}' VALID UNTIL '{{expiration}}'; GRANT SELECT ON ALL TABLES IN SCHEMA public TO \"{{name}}\";"]
}
