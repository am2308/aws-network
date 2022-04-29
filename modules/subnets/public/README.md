<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_eip.default-nat](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/eip) | resource |
| [aws_nat_gateway.default-nat-gateway](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/nat_gateway) | resource |
| [aws_route.igw](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route) | resource |
| [aws_route_table.default-public-route-table](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table) | resource |
| [aws_route_table_association.default-public-route-table-association](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table_association) | resource |
| [aws_subnet.default-public-subnet](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_azs"></a> [azs](#input\_azs) | n/a | `list(string)` | n/a | yes |
| <a name="input_destination_cidr"></a> [destination\_cidr](#input\_destination\_cidr) | n/a | `string` | n/a | yes |
| <a name="input_enable_nat_gateway"></a> [enable\_nat\_gateway](#input\_enable\_nat\_gateway) | n/a | `bool` | n/a | yes |
| <a name="input_igw_id"></a> [igw\_id](#input\_igw\_id) | n/a | `string` | n/a | yes |
| <a name="input_public_cidrs"></a> [public\_cidrs](#input\_public\_cidrs) | n/a | `list(string)` | n/a | yes |
| <a name="input_public_subnet_name"></a> [public\_subnet\_name](#input\_public\_subnet\_name) | n/a | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | n/a | `map(string)` | n/a | yes |
| <a name="input_vpc_id"></a> [vpc\_id](#input\_vpc\_id) | n/a | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_natgw_ids"></a> [natgw\_ids](#output\_natgw\_ids) | n/a |
| <a name="output_natgw_public_ips"></a> [natgw\_public\_ips](#output\_natgw\_public\_ips) | n/a |
| <a name="output_public_azs"></a> [public\_azs](#output\_public\_azs) | Subnet AZs |
| <a name="output_public_cidrs"></a> [public\_cidrs](#output\_public\_cidrs) | List of cidr\_blocks |
| <a name="output_public_route_tables"></a> [public\_route\_tables](#output\_public\_route\_tables) | n/a |
| <a name="output_public_subnets"></a> [public\_subnets](#output\_public\_subnets) | List of Subnet ids |
<!-- END_TF_DOCS -->
