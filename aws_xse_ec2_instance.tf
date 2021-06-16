resource "aws_instance" "ecc_elasticsearch" {
  key_name      = aws_key_pair.ecc_elastic_kp.key_name
  ami           = "ami-0747bdcabd34c712a"
  instance_type = "t2.medium"

  tags = {
    Name = "ecc-elasticsearch"
  }

  vpc_security_group_ids = [
    aws_security_group.ecs_xse_sg.id
  ]

  connection {
    type        = "ssh"
    user        = "ubuntu"
    private_key = file("key")
  }

  ebs_block_device {
    device_name = "/dev/sda1"
    volume_type = "gp2"
    volume_size = 30
  }
}

resource "aws_key_pair" "ecc_elastic_kp" {
  key_name = "ecc_elastic_kp"
  public_key = file("key.pub")
  }

resource "aws_network_interface" "xse_network_interface" {
  subnet_id   = aws_subnet.xse_subnet1_useast1.id

  tags = {
    Name = "xse_network_interface"
  }
}

resource "aws_eip" "xse_eip" {
  instance = aws_instance.ecc_elasticsearch.id
  vpc      = true
}

resource "aws_eip_association" "eip_assoc" {
  instance_id   = aws_instance.ecc_elasticsearch.id
  allocation_id = aws_eip.xse_eip.id
}
