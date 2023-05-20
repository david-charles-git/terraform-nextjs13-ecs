# CONFIGURATION & PROVIDERS FOR AWS INFRASTRUCTURE
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
  region  = var.aws_provider_region
  #access_key = var.aws_provider_access_key
  #secret_key = var.aws_provider_secret_key
}


