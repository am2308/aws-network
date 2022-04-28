output "private_subnets" {
  description = "List of Subnet ids"
  value       = aws_subnet.default-private-subnet.*.id
}

output "private_route_tables" {
  value = aws_route_table.default-private-route-table.*.id
}

output "private_azs" {
  description = "Subnet AZs"
  value       = var.azs
}

output "private_cidrs" {
  description = "List of cidr_blocks"
  value       = aws_subnet.default-private-subnet.*.cidr_block
}
