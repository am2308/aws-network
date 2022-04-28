variable "private_subnet_name" {
  type = string
}

variable "vpc_id" {
  type = string
}

variable "private_cidrs" {
  type = list(string)
}

variable "azs" {
  type = list(string)
}

variable "tags" {
  type    = map(string)
}

variable "natgw_ids" {
  type    = list(string)
}

variable "vpn_gateway" {
  type    = string
}

variable "enable_nat_gateway" {
  type    = bool
}

variable "destination_cidr" {
  type    = string
}
