##
variable "env" {
  description = "env name" 
  type        = string
}

variable "managed_by" {
  description = "resorces namaged by"
  type        = string
}

variable "project" {
  description = "project name"
  type        = string
}

variable "vpc_name" {
  description = "Name to be used on all the resources as identifier"
  type        = string
}

variable "cidr" {
  description = "The CIDR block for the VPC. Default value is a valid CIDR, but not acceptable by AWS and should be overridden"
  type        = string
}

variable "secondary_cidr_blocks" {
  description = "List of secondary CIDR blocks to associate with the VPC to extend the IP Address pool"
  type        = list(string)
}

variable additional_tags {
  type              = map(string)
  description       = "Additional tags to be applied to some resources"
  default           = {
    "Unit"          = "Test"
  }
}

variable "enable_internet_gateway" {
  type    = bool
}

variable "private_subnet_name" {
  description = "private subnet name"
  type = string
}

variable "private_cidrs" {
  description = "cidr ranges for private subnets across azs"
  type = list(string)
}

variable "azs" {
  description = "list of azs for disaster recovery"
  type = list(string)
}

#variable "natgw_ids" {
 # description = "nat gateway would be created in public subnet module and output the natgw_ids"
#  type    = list(string)
#  default = []
#}

variable "enable_nat_gateway" {
  description = "flat to set for nat gateway to access internet in private subnet"
  type    = bool
}

variable "vpn_gateway" {
  type    = string
  default = ""
}

variable "public_subnet_name" {
  description = "name of public subnet"
  type = string
}

variable "public_cidrs" {
  description = "cidr ranges for public subnets across azs"
  type = list(string)
}

variable "security_group_name" {
  description = "Name to be used for security group"
  type        = string
}

variable "ingress_cidr" {
  type = list(string)
}

variable "instance_name" {
  description = "Name of the instance"
  type        = string
}

variable "instance_type" {
  description = "Type of the instance"
  type        = string
}

variable "ami" {
  description = "ami for ec2"
  type        = string
}

variable "monitoring_enable" {
  description = "flag for enhanced monitoring"
  type        = bool
}

variable "delete_termination" {
  description = "Flag for EBS to be deleted when instance terminates"
  type        = bool
}

variable "size_ebs" {
  description = "size of ebs"
  type        = number
}

variable "type_ebs" {
  description = "type of ebs"
  type        = string
}

variable "destination_cidr" {
  description = "cidr for nat gateway destination in private subnet"
  type    = string
}
