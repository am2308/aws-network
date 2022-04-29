##This resource will cerate public subnet
resource "aws_subnet" "default-public-subnet" {
  count = length(var.public_cidrs)

  vpc_id            = var.vpc_id
  cidr_block        = var.public_cidrs[count.index]
  availability_zone = element(var.azs, count.index)

  tags = merge({
    "Name" = format("%s-public-%s", var.public_subnet_name, element(var.azs, count.index))
    },
    var.tags
  )
}

##This resource will create route table for public subnet
resource "aws_route_table" "default-public-route-table" {
  vpc_id = var.vpc_id

  tags = merge({ "Name" = "${var.public_subnet_name}-public" }, var.tags)

}

resource "aws_route" "igw" {
  route_table_id         = aws_route_table.default-public-route-table.id
  destination_cidr_block = var.destination_cidr
  gateway_id             = var.igw_id

  timeouts {
    create = "5m"
  }
}

##This resource will associate route table with public subnet
resource "aws_route_table_association" "default-public-route-table-association" {
  count = length(var.public_cidrs)

  subnet_id      = element(aws_subnet.default-public-subnet.*.id, count.index)
  route_table_id = aws_route_table.default-public-route-table.id
}


##This resource create ip for nat gateway
resource "aws_eip" "default-nat" {
  count = var.enable_nat_gateway == true ? length(var.public_cidrs) : 0

  vpc = true
  tags = merge(
    {
      "Name" = format(
        "%s-%s",
        var.public_subnet_name,
        element(var.azs, count.index),
      )
    },
    var.tags,
  )
}

##This resource will create nat gateway
resource "aws_nat_gateway" "default-nat-gateway" {
  count = var.enable_nat_gateway == true ? length(var.public_cidrs) : 0

  allocation_id = element(aws_eip.default-nat.*.id, count.index)
  subnet_id     = element(aws_subnet.default-public-subnet.*.id, count.index)
  tags = merge(
    {
      "Name" = format(
        "%s-%s",
        var.public_subnet_name,
        element(var.azs, count.index),
      )
    },
  var.tags)
}


