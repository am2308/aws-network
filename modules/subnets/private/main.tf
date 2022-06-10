##This will create private subnet.
resource "aws_subnet" "default-private-subnet" {
  count = length(var.private_cidrs)

  vpc_id            = var.vpc_id
  cidr_block        = var.private_cidrs[count.index]
  availability_zone = element(var.azs, count.index)

  tags = merge({
    "Name" = format("%s-private-%s", var.private_subnet_name, element(var.azs, count.index))
    },
    var.tags
  )

}

##This will create route table to link with private sunbet
resource "aws_route_table" "default-private-route-table" {
  count  = length(var.private_cidrs)
  vpc_id = var.vpc_id

  tags = merge(
    { "Name" = format("%s-private-%s", var.private_subnet_name, element(var.azs, count.index)) },
    var.tags
  )

  lifecycle {
    # When attaching VPN gateways it is common to define aws_vpn_gateway_route_propagation
    # resources that manipulate the attributes of the routing table (typically for the private subnets)
    ignore_changes = [propagating_vgws]
  }
}

##This will associate nat gateway to allow outbound internet traffic
resource "aws_route" "nat_gateway" {
  count = var.enable_nat_gateway ? length(var.natgw_ids) : 0

  route_table_id         = element(aws_route_table.default-private-route-table.*.id, count.index)
  destination_cidr_block = var.destination_cidr
  nat_gateway_id         = element(var.natgw_ids, count.index)

  timeouts {
    create = "5m"
  }
}

##This is associate route table with private subnet
resource "aws_route_table_association" "default-private-route-table-association" {
  count = length(var.private_cidrs)

  subnet_id      = element(aws_subnet.default-private-subnet.*.id, count.index)
  route_table_id = element(aws_route_table.default-private-route-table.*.id, ((length(var.natgw_ids) == 1) ? 0 : count.index))
}

##This will create vpn gateway if required
resource "aws_vpn_gateway_route_propagation" "default-vpn-gateway" {
  count = var.vpn_gateway != "" ? length(var.private_cidrs) : 0

  vpn_gateway_id = var.vpn_gateway
  route_table_id = aws_route_table.default-private-route-table[count.index].id
}

