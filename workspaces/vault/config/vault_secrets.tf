
resource "vault_mount" "secrets" {
  path        = "secrets"
  type        = "kv-v2"
  description = "Generic (kv2) secrets backend"
}
