# Create subnet # 1 in us-east-1
resource "aws_subnet" "xss_subnet_useast1" {
  provider          = aws
  availability_zone = element(data.aws_availability_zones.openlxp-azs.names, 0)
  vpc_id            = aws_vpc.openlxp_vpc.id
  cidr_block        = "10.0.14.0/24"

  tags = {
    Name = "xss_subnet_useast1"
  }
}


# Create subnet # 2  in us-east-1
resource "aws_subnet" "xss_subnet2_useast1" {
  provider          = aws
  vpc_id            = aws_vpc.openlxp_vpc.id
  availability_zone = element(data.aws_availability_zones.openlxp-azs.names, 1)
  cidr_block        = "10.0.16.0/24"

  tags = {
    Name = "xss_subnet2_useast1"
  }
}
