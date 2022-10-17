variable "region" {
    description = "AWS region into which HCP Vault as well as AWS resources are to be deployed"
    default = "eu-central-1"
}

variable "subnet-block1" {
    default = "172.27.1.0/24"
}

variable "subnet-block2" {
    default = "172.27.2.0/24"
}

variable "dbpassword" {
    default = "supergeheim"
}

variable "username" {
    default = "admin"
}


