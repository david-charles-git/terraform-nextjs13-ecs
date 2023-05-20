# CONFIGURATION & PROVIDERS FOR AWS ECR
# Please try to keep this files variables in alphabetical order

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4"
    }
  }
}

provider "aws" {
  profile = "default"
  region  = var.aws_ecr_nextjs_region
}


