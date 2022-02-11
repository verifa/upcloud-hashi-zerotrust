resource "vault_mount" "db" {
  path        = "postgres"
  type        = "database"
  description = "Managed UpCloud database"
}