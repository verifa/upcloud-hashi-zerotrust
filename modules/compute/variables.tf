
variable "project" {
  description = "Project which the resources belongs to"
  type        = string
}

variable "environment" {
  description = "Environment for the resources (e.g. prod/dev)"
  type        = string
}

variable "server" {
  description = "Server Configuration"
  type = object({
    name      = string
    image     = string
    disk_size = number
    region    = string
    plan      = string
    # ssh_trusted_ca = string
  })
}
