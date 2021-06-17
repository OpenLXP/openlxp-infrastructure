# Create subnet # 1 in us-east-1
resource "aws_subnet" "xds_subnet_useast1" {
  provider          = aws
  availability_zone = element(data.aws_availability_zones.ecc-azs.names, 0)
  vpc_id            = aws_vpc.ecc_vpc.id
  cidr_block        = "10.0.20.0/24"

  tags = {
    Name = "xds_subnet_useast1"
  }
}


# Create subnet # 2  in us-east-1
resource "aws_subnet" "xds_subnet2_useast1" {
  provider          = aws
  vpc_id            = aws_vpc.ecc_vpc.id
  availability_zone = element(data.aws_availability_zones.ecc-azs.names, 1)
  cidr_block        = "10.0.22.0/24"

  tags = {
    Name = "xds_subnet2_useast1"
  }
}
