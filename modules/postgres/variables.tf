
variable "project" {
  description = "Project which the resources belongs to"
  type        = string
}

variable "environment" {
  description = "Environment for the resources (e.g. prod/dev)"
  type        = string
}

variable "db" {
  description = "DB Configuration"
  type = object({
    name = string
    plan = string
    zone = string
    properties = object({
      public_access = bool
      ip_filter     = set(string)
    })
  })
}

variable "vault_mount_path" {
  type        = string
  description = "Path to where the database secrets engine is mounted in Vault."
  default     = "database"
}
