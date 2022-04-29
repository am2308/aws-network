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

variable "subnet_id" {
  description = "subnet where ec2 needs to be provisioned"
  type        = string
}

variable "security_group_id" {
  description = "security group to attch with ec2"
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

variable "tags" {
  type    = map(string)
}

