terraform {
  required_version = ">= 1.0.0"

  required_providers {
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

provider "aws" {
  region = var.region
}

