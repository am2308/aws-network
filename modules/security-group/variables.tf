variable "security_group_name" {
  description = "Name to be used for security group"
  type        = string
}

variable "vpc_id" {
  type = string
}

variable "ingress_cidr" {
  type = list(string)
}

variable "tags" {
  type    = map(string)
}

