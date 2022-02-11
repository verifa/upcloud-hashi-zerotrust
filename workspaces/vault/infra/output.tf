output "vault_public_endpoint_url" {
  value = hcp_vault_cluster.zerotrust_vault.vault_public_endpoint_url
}

output "vault_private_endpoint_url" {
  value = hcp_vault_cluster.zerotrust_vault.vault_private_endpoint_url
}

output "vault_cluster_id" {
    value = hcp_vault_cluster.zerotrust_vault.cluster_id
}

output "aws_vpc_id" {
  value = aws_vpc.peer.id
}

output "aws_vpc_cidr_block" {
  value = aws_vpc.peer.cidr_block
}