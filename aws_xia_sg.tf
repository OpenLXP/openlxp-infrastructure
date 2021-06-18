# security group to allow inbound connection on port 8000 from VPC cidr. 443&80 from anywhere
resource "aws_security_group" "ecs_xia_sg" {
  name        = "ecs_xia_sg"
  description = "Allow TLS inbound traffic on ports 8000,8010,8020,80,443"
  vpc_id      = aws_vpc.openlxp_vpc.id

  ingress {
    description = "TLS from VPC"
    from_port   = 8000
    to_port     = 8000
    protocol    = "tcp"
    cidr_blocks = [aws_vpc.openlxp_vpc.cidr_block]
  }

  ingress {
    description = "TLS from VPC"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }


  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "ecc_xia_sg"
  }
}

# security group to allow inbound on port 3306
resource "aws_security_group" "ecs_xia_mysql_sg" {
  name        = "ecs_xia_mysql_sg"
  description = "Allow MySQL connectivity"
  vpc_id      = aws_vpc.openlxp_vpc.id

  ingress {
    description = "TLS from VPC"
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = [aws_vpc.openlxp_vpc.cidr_block]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "ecc_xia_db_sg"
  }
}
