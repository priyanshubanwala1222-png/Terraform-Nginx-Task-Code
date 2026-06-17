# output "Public-subnet-1-id" {
#   value = aws_subnet.Public-subnet-1.id
# }

output "public_1_subnet_id" {
  value = aws_subnet.public["public-1"].id
}

output "public_2_subnet_id" {
  value = aws_subnet.public["public-2"].id
}

output "Private-subnet-1-id" {
  value = aws_subnet.private["private-1"].id
}

output "Private-subnet-2-id" {
  value = aws_subnet.private["private-2"].id
}

output "Route-table-public-id" {
  value = aws_route_table.route-table-public-for-as.id
}

output "Route-table-private-id" {
  value = aws_route_table.route-table-private-for-as.id
}