
output "vault_ssh_mount_path" {
  value = vault_mount.ssh.path
}

output "vault_db_mount_path" {
  value = vault_mount.db.path
}
