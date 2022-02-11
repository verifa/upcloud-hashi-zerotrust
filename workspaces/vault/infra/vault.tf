resource "hcp_hvn" "zerotrust_vault_hvn" {
  hvn_id         = var.hvn_id
  cloud_provider = var.cloud_provider
  region         = var.region
}

resource "hcp_vault_cluster" "zerotrust_vault" {
  hvn_id          = hcp_hvn.zerotrust_vault_hvn.hvn_id
  cluster_id      = var.cluster_id
  tier            = var.tier
  public_endpoint = var.enable_public_endpoint
}
