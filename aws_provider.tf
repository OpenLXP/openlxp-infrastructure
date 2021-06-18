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
  alias   = "openlxp_vpc"
}
