terraform {
  required_version = ">= 1.9.8" #Forcing which version of Terraform needs to be used
  required_providers {
    aws = {
      version = "<= 5.74.0" #Forcing which version of plugin needs to be used.
      source  = "hashicorp/aws"
    }
  }

  backend "s3" {
    bucket = "devopspracticestatefile"
    key    = "terraform.tfstate"
    region = "ap-south-1"
  }
}

provider "aws" {
  region = var.aws_region
}