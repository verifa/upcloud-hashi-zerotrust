
variable "prefix" {
  type = string
}

variable "workspace" {
  type = object({
    name              = string
    working_directory = string
    tags              = set(string)
  })
}
