# Terraform will use provider stated below
provider "aws" {
  region = "us-east-1"
}

# Create Management VPC in us-east-1
resource "aws_vpc" "ecc_vpc" {
  provider             = aws
  cidr_block           = "10.0.0.0/16"
  enable_dns_support   = true
  enable_dns_hostnames = true
  tags = {
    Name = "ecc_vpc"
  }
}

# Create IGW in us-east-1
resource "aws_internet_gateway" "igw-ecc" {
  provider = aws
  vpc_id   = aws_vpc.ecc_vpc.id

  tags = {
    Name = "ECC-IGW"
  }
}

# Get all available AZ's in VPC for management region
data "aws_availability_zones" "ecc-azs" {
  provider = aws
  state    = "available"
}

# Create route table in us-east-1
resource "aws_route_table" "internet_route_ecc" {
  provider = aws
  vpc_id   = aws_vpc.ecc_vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw-ecc.id
  }
  tags = {
    Name = "ECC-RT"
  }
}
