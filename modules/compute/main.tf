
data "vault_generic_secret" "ssh_trusted_ca" {
  path = "ssh-client-signer/config/ca"
}

# 
# Create UpCloud server
# 
resource "upcloud_server" "this" {
  hostname = "${var.project}-${var.environment}-${var.server.name}"
  zone     = var.server.region
  plan     = var.server.plan
  metadata = true # false by default, must be enabled to enable ssh keys to be injected and cloud-init to run

  template {
    storage = var.server.image
    size    = var.server.disk_size
  }

  network_interface {
    type = "public"
  }

  user_data = templatefile("${path.module}/user_data/user_data.tftpl", { ssh_trusted_ca = data.vault_generic_secret.ssh_trusted_ca.data.public_key })
}
