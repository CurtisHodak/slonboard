terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
    }
  }
}


provider "aws" {
  region = var.aws_region
  version = ">= 6.5.0"
  default_tags {
    tags = {
      CreatedBy = "Terraform-custom"
    }
  }
}
