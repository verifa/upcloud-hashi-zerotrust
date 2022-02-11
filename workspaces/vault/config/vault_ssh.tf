resource "vault_mount" "ssh" {
  path        = "ssh-client-signer"
  type        = "ssh"
  description = "SSH secrets engine for clients to sign pub keys."
}

resource "vault_ssh_secret_backend_ca" "zerotrust" {
  backend              = vault_mount.ssh.path
  generate_signing_key = true
}

resource "vault_ssh_secret_backend_role" "upcloud_server" {
  name                    = "upcloud-server-role"
  allow_user_certificates = true
  backend                 = vault_mount.ssh.path
  key_type                = "ca"
  default_user            = "debian"
  allowed_users           = "*"
  ttl                     = "3600"
  max_ttl                 = "86400"
  allowed_extensions      = "permit-pty,permit-port-forwarding"
  default_extensions      = { "permit-pty" : "" } #allows you to get a terminal, nice type...
  algorithm_signer        = "rsa-sha2-512"        #needed for OpenSSH > 8.2
}