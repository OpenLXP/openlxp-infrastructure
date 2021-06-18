# Terraform will use provider stated below
provider "aws" {
  region = "us-east-1"
}

# Create Management VPC in us-east-1
resource "aws_vpc" "openlxp_vpc" {
  provider             = aws
  cidr_block           = "10.0.0.0/16"
  enable_dns_support   = true
  enable_dns_hostnames = true
  tags = {
    Name = "openlxp_vpc"
  }
}

# Create IGW in us-east-1
resource "aws_internet_gateway" "igw-openlxp" {
  provider = aws
  vpc_id   = aws_vpc.openlxp_vpc.id

  tags = {
    Name = "OPENLXP-IGW"
  }
}

# Get all available AZ's in VPC for management region
data "aws_availability_zones" "openlxp-azs" {
  provider = aws
  state    = "available"
}

# Create route table in us-east-1
resource "aws_route_table" "internet_route_openlxp" {
  provider = aws
  vpc_id   = aws_vpc.openlxp_vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw-openlxp.id
  }
  tags = {
    Name = "OPENLXP-RT"
  }
}
