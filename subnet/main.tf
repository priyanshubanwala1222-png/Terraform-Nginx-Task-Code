resource "aws_subnet" "Public-subnet-1" {
  vpc_id     = var.vpc-id
  cidr_block = var.CIDR-block-Public-1
  availability_zone = var.east-1a-az
  map_public_ip_on_launch = var.map_public_ip_on_launch


  tags = {
    Name = "${var.NAME}-Public-Subnet-1-as-2"
    Tier = "Public"
  }
}

resource "aws_subnet" "Public-subnet-2" {
  vpc_id     = var.vpc-id
  cidr_block = var.CIDR-block-Public-2
  availability_zone = var.east-1b-az
  map_public_ip_on_launch = var.map_public_ip_on_launch


  tags = {
    Name = "${var.NAME}-Public-Subnet-2-as-2"
    Tier = "Public"
  }
}

resource "aws_subnet" "Private-subnet-1" {
  vpc_id     = var.vpc-id
  cidr_block = var.CIDR-block-Private-3
  availability_zone = var.east-1a-az

  tags = {
    Name = "${var.NAME}-Private-Subnet-1-as-2"
    Tier = "Private"
  }
}

resource "aws_subnet" "Private-subnet-2" {
  vpc_id     = var.vpc-id
  cidr_block = var.CIDR-block-Private-4
  availability_zone = var.east-1b-az

  tags = {
    Name = "${var.NAME}-Private-Subnet-2-as-2"
    Tier = "Private"
  }
}

resource "aws_route_table" "route-table-public-for-as" {
  vpc_id = var.vpc-id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = var.igw-id
  }

  tags = {
    Name = "${var.NAME}-route-table-public-as-2"
  }
}

resource "aws_route_table" "route-table-private-for-as" {
  vpc_id = var.vpc-id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = var.nat-gateway-id
  }

  tags = {
    Name = "${var.NAME}-route-table-private-as-2"
  }
}

resource "aws_route_table_association" "task-1-rt-assocation-public-1" {
  subnet_id      = aws_subnet.Public-subnet-1.id
  route_table_id = aws_route_table.route-table-public-for-as.id
}

resource "aws_route_table_association" "task-1-rt-assocation-public-2" {
  subnet_id      = aws_subnet.Public-subnet-2.id
  route_table_id = aws_route_table.route-table-public-for-as.id
}

resource "aws_route_table_association" "task-1-rt-assocation-private-1" {
  subnet_id      = aws_subnet.Private-subnet-1.id
  route_table_id = aws_route_table.route-table-private-for-as.id
}

resource "aws_route_table_association" "task-1-rt-assocation-private-2" {
  subnet_id      = aws_subnet.Private-subnet-2.id
  route_table_id = aws_route_table.route-table-private-for-as.id
}