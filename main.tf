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
  address = data.terraform_remote_state.hcp.outputs.primary_vault_private_endpoint_url
}

provider "aws" {
  region = var.region
}

