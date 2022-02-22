
resource "vault_terraform_cloud_secret_creds" "token" {
  backend = "tfc"
  role    = "tunaboat"
}
