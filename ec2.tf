resource "aws_vpc" "vpc-df" {
  cidr_block = "10.0.0.0/16"
}

resource "aws_subnet" "subnet-df" {
  vpc_id            = aws_vpc.vpc-df.id
  cidr_block        = "10.0.1.0/24"
  availability_zone = "us-east-1a"
}

resource "aws_network_interface" "ni-df" {
  subnet_id = aws_subnet.subnet-df.id
}

resource "aws_instance" "ec2-df" {
  ami           = var.ec2_ami
  instance_type = var.ec2_types

  network_interface {
    network_interface_id = aws_network_interface.ni-df.id
    device_index         = 0
  }
}
