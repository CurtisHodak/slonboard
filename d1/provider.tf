terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.96.0"
    }
  }
}

provider "aws" {
  region = var.aws_region

  default_tags {
    tags = {
      CreatedBy = "Terraform-custom"
    }
  }
}

# Add a note 1