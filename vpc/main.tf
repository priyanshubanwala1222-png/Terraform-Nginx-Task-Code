resource "aws_vpc" "VPC_structure" {
  cidr_block       = var.cidr_block_vari
  instance_tenancy = var.instance_tenancy

  tags = {
    Name = var.vpc-Name
  }
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.VPC_structure.id

  tags = {
    Name = "${var.vpc-Name}-igw"
  }
}

resource "aws_eip" "elastic-ip" {
  domain   = "vpc"

  tags = {
    Name = "${var.vpc-Name}-elastic-ip"
  }
}

resource "aws_nat_gateway" "nat-gateway" {
  allocation_id = aws_eip.elastic-ip.id
  subnet_id     = var.public_1_subnet_id
  depends_on = [aws_internet_gateway.igw]

  tags = {
    Name = "${var.vpc-Name}-nat-gt"
  }
}