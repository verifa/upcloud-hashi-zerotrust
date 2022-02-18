resource "upcloud_managed_database_postgresql" "this" {
  name = "vault-managed-postgres"
  plan = "1x1xCPU-2GB-25GB"
  zone = "fi-hel1"
  properties {
    public_access = true
    ip_filter     = ["0.0.0.0/0"]
  }
}

resource "vault_database_secret_backend_connection" "this" {
  backend       = var.vault_mount_path
  name          = "upcloud-postgres"
  allowed_roles = ["admin-role"]

  postgresql {
    connection_url = "postgres://${upcloud_managed_database_postgresql.this.service_username}:${upcloud_managed_database_postgresql.this.service_password}@public-${upcloud_managed_database_postgresql.this.service_host}:${upcloud_managed_database_postgresql.this.service_port}/defaultdb?sslmode=require"
  }
}

resource "vault_database_secret_backend_role" "this" {
  backend             = var.vault_mount_path
  name                = "admin-role"
  db_name             = vault_database_secret_backend_connection.this.name
  creation_statements = ["CREATE ROLE \"{{name}}\" WITH LOGIN PASSWORD '{{password}}' VALID UNTIL '{{expiration}}'; GRANT SELECT ON ALL TABLES IN SCHEMA public TO \"{{name}}\";"]
}
