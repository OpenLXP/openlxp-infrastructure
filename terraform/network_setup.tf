provider "aws" {
  region = "us-east-1"
}

# Create Management VPC in us-east-1
resource "aws_vpc" "vpc_management" {
  provider             = aws
  cidr_block           = "10.0.0.0/16"
  enable_dns_support   = true
  enable_dns_hostnames = true
  tags = {
    Name = "vpc-management"
  }
}

# Create IGW in us-east-1
resource "aws_internet_gateway" "igw-management" {
  provider = aws
  vpc_id   = aws_vpc.vpc_management.id

  tags = {
    Name = "ECC-IGW"
  }
}

# Get all available AZ's in VPC for management region
data "aws_availability_zones" "management-azs" {
  provider = aws
  state    = "available"
}

# Create subnet # 1 in us-east-1
resource "aws_subnet" "xia_subnet_useast1" {
  provider          = aws
  availability_zone = element(data.aws_availability_zones.management-azs.names, 0)
  vpc_id            = aws_vpc.vpc_management.id
  cidr_block        = "10.0.1.0/24"

  tags = {
    Name = "xia_subnet_useast1"
  }
}


# Create subnet # 2  in us-east-1
resource "aws_subnet" "xia_subnet2_useast1" {
  provider          = aws
  vpc_id            = aws_vpc.vpc_management.id
  availability_zone = element(data.aws_availability_zones.management-azs.names, 1)
  cidr_block        = "10.0.4.0/24"

  tags = {
    Name = "xia_subnet2_useast1"
  }
}

# Create route table in us-east-1
resource "aws_route_table" "internet_route_management" {
  provider = aws
  vpc_id   = aws_vpc.vpc_management.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw-management.id
  }
  tags = {
    Name = "ECC-RT"
  }
}

