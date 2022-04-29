variable "public_subnet_name" {
  type = string
}

variable "vpc_id" {
  type = string
}

variable "igw_id" {
  type = string
}

variable "public_cidrs" {
  type = list(string)
}

variable "azs" {
  type = list(string)
}

variable "tags" {
  type    = map(string)
}

variable "enable_nat_gateway" {
  type    = bool
}

variable "destination_cidr" {
  type    = string
}

