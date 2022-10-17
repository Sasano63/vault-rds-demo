terraform {
  required_version = ">= 1.0.0"

  required_providers {
    vault = {
      source = "hashicorp/vault"
      version = "3.9.1"
    }
    aws = {
      source  = "hashicorp/aws"
      version = ">= 3.45.0"
    }
  }
}

# data "terraform_remote_state" "vault" {
#   backend = "remote"

#   config = {
#     organization = "sasano"
#     workspaces = {
#       name = "aws-vault-demo-deployment"
#     }
#   }
# }

data "terraform_remote_state" "hcp" {
  backend = "remote"

  config = {
    organization = "sasano"
    workspaces = {
      name = "vault-hcp-demo"
    }
  }
}


provider "vault" {
}

provider "aws" {
  region = var.region
}

