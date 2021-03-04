terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

# Separate VPC providers
provider "aws" {
  profile = var.profile
  region  = var.region-management
  alias   = "ecc-management-region"
}


#provider "aws" {
#  profile = var.profile
#  region  = var.region-production
#  alias   = "ecc-production-region"
#}

