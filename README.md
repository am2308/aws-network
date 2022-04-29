<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 4.10.0 |

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 4.10.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | ~> 4.10.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_ec2"></a> [ec2](#module\_ec2) | ./modules/ec2 | n/a |
| <a name="module_vpc"></a> [vpc](#module\_vpc) | ./modules/vpc | n/a |
| <a name="module_security_group"></a> [security_group](#module\_security_group) | ./modules/security_group | n/a |
| <a name="module_public"></a> [public](#module\subnets\_public) | ./modules/subnets/public | n/a |
## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_additional_tags"></a> [additional\_tags](#input\_additional\_tags) | Additional tags to be applied to some resources | `map(string)` | n/a | yes |
| <a name="input_ami"></a> [ami](#input\_ami) | ami for ec2 | `string` | n/a | yes |
| <a name="input_azs"></a> [azs](#input\_azs) | list of azs for disaster recovery | `list(string)` | n/a | yes |
| <a name="input_cidr"></a> [cidr](#input\_cidr) | The CIDR block for the VPC. Default value is a valid CIDR, but not acceptable by AWS and should be overridden | `string` | n/a | yes |
| <a name="input_delete_termination"></a> [delete\_termination](#input\_delete\_termination) | Flag for EBS to be deleted when instance terminates | `bool` | n/a | yes |
| <a name="input_destination_cidr"></a> [destination\_cidr](#input\_destination\_cidr) | cidr for nat gateway destination in private subnet | `string` | n/a | yes |
| <a name="input_enable_internet_gateway"></a> [enable\_internet\_gateway](#input\_enable\_internet\_gateway) | n/a | `bool` | n/a | yes |
| <a name="input_enable_nat_gateway"></a> [enable\_nat\_gateway](#input\_enable\_nat\_gateway) | flat to set for nat gateway to access internet in private subnet | `bool` | n/a | yes |
| <a name="input_env"></a> [env](#input\_env) | env name | `string` | n/a | yes |
| <a name="input_ingress_cidr"></a> [ingress\_cidr](#input\_ingress\_cidr) | n/a | `list(string)` | n/a | yes |
| <a name="input_instance_name"></a> [instance\_name](#input\_instance\_name) | Name of the instance | `string` | n/a | yes |
| <a name="input_instance_type"></a> [instance\_type](#input\_instance\_type) | Type of the instance | `string` | n/a | yes |
| <a name="input_managed_by"></a> [managed\_by](#input\_managed\_by) | resorces namaged by | `string` | n/a | yes |
| <a name="input_monitoring_enable"></a> [monitoring\_enable](#input\_monitoring\_enable) | flag for enhanced monitoring | `bool` | n/a | yes |
| <a name="input_private_cidrs"></a> [private\_cidrs](#input\_private\_cidrs) | cidr ranges for private subnets across azs | `list(string)` | n/a | yes |
| <a name="input_private_subnet_name"></a> [private\_subnet\_name](#input\_private\_subnet\_name) | private subnet name | `string` | n/a | yes |
| <a name="input_project"></a> [project](#input\_project) | project name | `string` | n/a | yes |
| <a name="input_public_cidrs"></a> [public\_cidrs](#input\_public\_cidrs) | cidr ranges for public subnets across azs | `list(string)` | n/a | yes |
| <a name="input_public_subnet_name"></a> [public\_subnet\_name](#input\_public\_subnet\_name) | name of public subnet | `string` | n/a | yes |
| <a name="input_secondary_cidr_blocks"></a> [secondary\_cidr\_blocks](#input\_secondary\_cidr\_blocks) | List of secondary CIDR blocks to associate with the VPC to extend the IP Address pool | `list(string)` | n/a | yes |
| <a name="input_security_group_name"></a> [security\_group\_name](#input\_security\_group\_name) | Name to be used for security group | `string` | n/a | yes |
| <a name="input_size_ebs"></a> [size\_ebs](#input\_size\_ebs) | size of ebs | `number` | n/a | yes |
| <a name="input_type_ebs"></a> [type\_ebs](#input\_type\_ebs) | type of ebs | `string` | n/a | yes |
| <a name="input_vpc_name"></a> [vpc\_name](#input\_vpc\_name) | Name to be used on all the resources as identifier | `string` | n/a | yes |
| <a name="input_vpn_gateway"></a> [vpn\_gateway](#input\_vpn\_gateway) | n/a | `string` | `""` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_default-ec2-private-ip"></a> [default-ec2-private-ip](#output\_default-ec2-private-ip) | n/a |
<!-- END_TF_DOCS -->
