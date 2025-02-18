provider "aws" {
  region = var.aws_region
}

terraform {
  required_version = "<= 1.8.5" #Forcing which version of Terraform needs to be used
  required_providers {
    aws = {
      version = "<= 6.0.0" #Forcing which version of plugin needs to be used.
      source  = "hashicorp/aws"
    }
  }
  backend "s3" {
    bucket = "workspacesbucket011"
    key    = "Ansible.tfstate"
    region = "us-west-2"
    # dynamodb_table = "-terraform-locks"
    encrypt = true
  }
}
