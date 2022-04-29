output "public_subnets" {
  description = "List of Subnet ids"
  value       = aws_subnet.default-public-subnet.*.id
}

output "public_route_tables" {
  value = aws_route_table.default-public-route-table.*.id
}

output "natgw_ids" {
  value = var.enable_nat_gateway == true ? aws_nat_gateway.default-nat-gateway.*.id : null
}

output "natgw_public_ips" {
  value = var.enable_nat_gateway == true ? aws_eip.default-nat.*.public_ip : null
}

output "public_azs" {
  description = "Subnet AZs"
  value       = var.azs
}

output "public_cidrs" {
  description = "List of cidr_blocks"
  value       = aws_subnet.default-public-subnet.*.cidr_block
}

