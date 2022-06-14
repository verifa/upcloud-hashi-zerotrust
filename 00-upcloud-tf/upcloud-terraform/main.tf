terraform {
  required_providers {
    upcloud = {
      source  = "UpCloudLtd/upcloud"
      version = "~> 2.2.0"
    }
  }
}

provider "upcloud" {}

resource "upcloud_server" "this" {
  hostname = "my-ubuntu-server"
  zone     = "fi-hel1"
  plan     = "1xCPU-1GB"
  metadata = true

  template {
    storage = "Ubuntu Server 20.04 LTS (Focal Fossa)"
    size    = 25
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

output "server_public_ip" {
  value = upcloud_server.this.network_interface[0].ip_address
}

