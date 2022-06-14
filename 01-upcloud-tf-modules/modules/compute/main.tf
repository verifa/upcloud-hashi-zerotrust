resource "upcloud_server" "this" {
  hostname = "${var.project}-${var.environment}-${var.server.name}"
  zone     = var.server.region
  plan     = var.server.plan
  metadata = true

  template {
    storage = var.server.image
    size    = var.server.disk_size
  }

  network_interface {
    type = "public"
  }

  user_data = <<EOF
  #!/bin/bash
  echo "Hello World!" >> /root/hello.txt
  EOF

  login {
    user = "terraform"

    keys = [
      file("~/.ssh/id_rsa.pub")
    ]
  }
}
