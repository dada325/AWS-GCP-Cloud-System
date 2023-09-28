resource "aws_instance" "bastion" {
  ami           = var.ami_id
  instance_type = "t2.micro"
  subnet_id     = var.public_subnet_id

  tags = {
    Name = "bastion-host"
  }
}

resource "aws_nat_gateway" "nat_gateway" {
  allocation_id = aws_eip.eip_for_nat.id
  subnet_id     = var.public_subnet_id
}

resource "aws_eip" "eip_for_nat" {
  vpc = true
}
