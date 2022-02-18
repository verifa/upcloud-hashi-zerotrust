variable "inputs" {
  type = any
  description = "Input values from top-level YAML file describing the compute resources."
}

variable "env" {
  type = string
  description = "Name of an environment for example dev or prod."
  default = "dev"
}

variable "app" {
  type = string
  description = "Name of the application consuming the compute resources."
  default = "test-app"
}

variable "image" {
  type = string
  description = "ID of a custom image or template in UpCloud"
  default =  "01000000-0000-4000-8000-000030200200" #Ubuntu LTS 20.04
}

variable "ssh_trusted_ca" {
  type = string
  description = "Public key of the trusted CA in Vault, used for SSH access."
  default = "test"#TODO remove and provide via workspace var?
}
