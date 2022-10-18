variable "region" {
    description = "AWS region into which HCP Vault as well as AWS resources are to be deployed"
    default = "eu-central-1"
}

variable "dbpassword" {
    default = "supergeheim"
}

variable "username" {
    default = "admin"
}


