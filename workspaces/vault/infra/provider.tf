terraform {
  required_providers {
    aws = {
      version = "~> 4.0"
    }
    hcp = {
      version = "~> 0.22"
    }
  }
}

# Define credentials with env variables:
# - AWS_ACCESS_KEY_ID
# - AWS_SECRET_ACCESS_KEY
provider "aws" {
  region = var.region
}

# Define credentials with env variables:
# - HCP_CLIENT_ID
# - HCP_CLIENT_SECRET
provider "hcp" {}