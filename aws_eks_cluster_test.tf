ource "aws_eks_cluster" "eks_cluster_name" {
  name        = "my-test-eks"
  role_arn = aws_iam_role.eks_cluster_role.arn

vpc_config {
 subnet_ids = ["subnet-0669318e0cb07916c", "subnet-0270bcb6f9da4f34f"]
}
}

data "aws_availability_zones" "availability_zones" {
  state = "available"
}

resource "aws_vpc" "app_vpc" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_hostnames = true

  tags = {
   Name = "vpc-management"
 }
}

resource "aws_internet_gateway" "app_internet_gateway" {
  vpc_id = aws_vpc.app_vpc.id
}

locals {
  number_to_create = length(data.aws_availability_zones.availability_zones.names)
}

resource "aws_subnet" "app_subnets" {
  count                   = local.number_to_create
  map_public_ip_on_launch = true
  availability_zone       = data.aws_availability_zones.availability_zones.names[count.index]
  cidr_block              = cidrsubnet(aws_vpc.app_vpc.cidr_block, 8, count.index + 1)
  vpc_id                  = aws_vpc.app_vpc.id

  tags = {
    "kubernetes.io/cluster/${var.eks_cluster_name}" = "shared"
  }
}

resource "aws_route_table" "app_route_tables" {
  count  = local.number_to_create
  vpc_id = aws_vpc.app_vpc.id


  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.app_internet_gateway.id
  }

  tags = {
    Name = "app_route_table_${count.index + 1}"
  }

resource "aws_route_table_association" "route_table_association" {
  count          = local.number_to_create
  route_table_id = aws_route_table.app_route_tables[count.index].id
  subnet_id      = aws_subnet.app_subnets[count.index].id
}

