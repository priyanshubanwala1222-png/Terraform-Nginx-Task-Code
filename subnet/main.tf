resource "aws_subnet" "public" {
  for_each = var.public_subnets

  vpc_id                  = var.vpc-id
  cidr_block              = each.value.cidr_block
  availability_zone       = each.value.availability_zone
  map_public_ip_on_launch = var.map_public_ip_on_launch

  tags = {
    Name = "${var.NAME}-Public-${each.key}-as-2"
    Tier = "Public"
  }
}

resource "aws_subnet" "private" {
  for_each = var.private_subnets

  vpc_id                  = var.vpc-id
  cidr_block              = each.value.cidr_block
  availability_zone       = each.value.availability_zone

  tags = {
    Name = "${var.NAME}-Private-${each.key}"
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
  subnet_id      = aws_subnet.public["public-1"].id
  route_table_id = aws_route_table.route-table-public-for-as.id
}

resource "aws_route_table_association" "task-1-rt-assocation-public-2" {
  subnet_id      = aws_subnet.public["public-2"].id
  route_table_id = aws_route_table.route-table-public-for-as.id
}

resource "aws_route_table_association" "task-1-rt-assocation-private-1" {
  subnet_id      = aws_subnet.private["private-1"].id
  route_table_id = aws_route_table.route-table-private-for-as.id
}

resource "aws_route_table_association" "task-1-rt-assocation-private-2" {
  subnet_id      = aws_subnet.private["private-2"].id
  route_table_id = aws_route_table.route-table-private-for-as.id
}