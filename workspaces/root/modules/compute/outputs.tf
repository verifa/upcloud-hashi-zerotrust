output "server_public_ip" {
  value = tomap({
    for k, server in upcloud_server.this : k => server.network_interface[0].ip_address
  })
}
