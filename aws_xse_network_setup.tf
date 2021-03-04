# Create subnet # 1 in us-east-1
resource "aws_subnet" "xse_subnet_useast1" {
  provider          = aws
  availability_zone = element(data.aws_availability_zones.management-azs.names, 0)
  vpc_id            = aws_vpc.vpc_management.id
  cidr_block        = "10.0.6.0/24"

  tags = {
    Name = "xse_subnet_useast1"
  }
}


# Create subnet # 2  in us-east-1
resource "aws_subnet" "xse_subnet2_useast1" {
  provider          = aws
  vpc_id            = aws_vpc.vpc_management.id
  availability_zone = element(data.aws_availability_zones.management-azs.names, 1)
  cidr_block        = "10.0.8.0/24"

  tags = {
    Name = "xse_subnet2_useast1"
  }
}

