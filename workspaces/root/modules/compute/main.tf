resource "upcloud_server" "this" {
  count = var.inputs.count

  hostname = "terraform.ssh.example.tld"
  zone     = var.inputs.region
  plan     = var.inputs.size
  metadata = true # false by default, must be enabled to enable ssh keys to be injected and cloud-init to run

  template {
    storage = var.image
    size    = 25
  }

  network_interface {
    type = "public"
  }

  user_data = templatefile("${path.module}/user_data.tftpl", { ssh_trusted_ca = var.ssh_trusted_ca })
}
