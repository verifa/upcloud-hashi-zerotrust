variable "inputs" {
  type = any
  description = "Input values from top-level YAML file describing the database resources."
}

variable "env" {
  type = string
  description = "Name of an environment for example dev or prod."
  default = "dev"
}

variable "app" {
  type = string
  description = "Name of the application consuming the database resources."
  default = "test-app"
}

variable "vault_mount_path" {
  type = string
  description = "Path to where the database secrets engine is mounted in Vault."
  default = "database"
}
