# Create subnet # 1 in us-east-1
resource "aws_subnet" "xms_subnet_useast1" {
  provider          = aws
  availability_zone = element(data.aws_availability_zones.ecc-azs.names, 0)
  vpc_id            = aws_vpc.ecc_vpc.id
  cidr_block        = "10.0.10.0/24"

  tags = {
    Name = "xms_subnet_useast1"
  }
}


# Create subnet # 2  in us-east-1
resource "aws_subnet" "xms_subnet2_useast1" {
  provider          = aws
  vpc_id            = aws_vpc.ecc_vpc.id
  availability_zone = element(data.aws_availability_zones.ecc-azs.names, 1)
  cidr_block        = "10.0.12.0/24"

  tags = {
    Name = "xms_subnet2_useast1"
  }
}
