output "vpc-id" {
  value = aws_vpc.VPC_structure.id
}

output "igw-id" {
  value = aws_internet_gateway.igw.id
}

output "elastic-ip-id" {
  value = aws_eip.elastic-ip.id
}

output "nat-gateway-id" {
  value = aws_nat_gateway.nat-gateway.id
}