output "vpc_id" {
  value = aws_vpc.default-vpc.id
}

output "vpc_cidr" {
  value = aws_vpc.default-vpc.cidr_block
}

output "igw_id" {
  value = var.enable_internet_gateway ? aws_internet_gateway.default-igw["enabled"].id : ""
}
