##This resource will create vpc
resource "aws_vpc" "default-vpc" {
  cidr_block           = var.cidr
  instance_tenancy     = "default"
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = merge(
    {
      "Name" = var.vpc_name
    },
    var.tags,
  )
}

##This will create default route table
resource "aws_default_route_table" "default-route-table" {
  default_route_table_id = aws_vpc.default-vpc.default_route_table_id
  tags = merge(
    { "Name" = "${var.vpc_name}-default-rote-table" },
    var.tags
  )
}

##This will create default nacl
resource "aws_default_network_acl" "default-nacl" {
  default_network_acl_id = aws_vpc.default-vpc.default_network_acl_id

  # no rules defined, deny all traffic in this ACL

  # ignore readoption of deleted nacls
  lifecycle {
    ignore_changes = [subnet_ids]
  }

  tags = merge(
    { "Name" = "${var.vpc_name}-default-nacl" },
    var.tags
  )
}

##This will create default security group
resource "aws_default_security_group" "default-sg" {
  vpc_id = aws_vpc.default-vpc.id

  ingress = []
  egress  = []

  tags = merge(
    {
      "Name" = "{var.vpc_name}-default-sg"
    },
    var.tags,
  )
}

##This will associate ipv cidr range with default vpc
resource "aws_vpc_ipv4_cidr_block_association" "default-association" {
  for_each   = toset(var.secondary_cidr_blocks)
  vpc_id     = aws_vpc.default-vpc.id
  cidr_block = each.value
}

##This will create internet gateway to make public subnet
resource "aws_internet_gateway" "default-igw" {
  for_each = toset(var.enable_internet_gateway ? ["enabled"] : [])

  vpc_id = aws_vpc.default-vpc.id

  tags = merge(
    {
      "Name" = "${var.vpc_name}-default-igw"
    },
    var.tags,
  )
}
