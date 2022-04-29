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
| [aws_route.nat_gateway](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route) | resource |
| [aws_route_table.default-private-route-table](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table) | resource |
| [aws_route_table_association.default-private-route-table-association](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table_association) | resource |
| [aws_subnet.default-private-subnet](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet) | resource |
| [aws_vpn_gateway_route_propagation.default-vpn-gateway](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpn_gateway_route_propagation) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_azs"></a> [azs](#input\_azs) | n/a | `list(string)` | n/a | yes |
| <a name="input_destination_cidr"></a> [destination\_cidr](#input\_destination\_cidr) | n/a | `string` | n/a | yes |
| <a name="input_enable_nat_gateway"></a> [enable\_nat\_gateway](#input\_enable\_nat\_gateway) | n/a | `bool` | n/a | yes |
| <a name="input_natgw_ids"></a> [natgw\_ids](#input\_natgw\_ids) | n/a | `list(string)` | n/a | yes |
| <a name="input_private_cidrs"></a> [private\_cidrs](#input\_private\_cidrs) | n/a | `list(string)` | n/a | yes |
| <a name="input_private_subnet_name"></a> [private\_subnet\_name](#input\_private\_subnet\_name) | n/a | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | n/a | `map(string)` | n/a | yes |
| <a name="input_vpc_id"></a> [vpc\_id](#input\_vpc\_id) | n/a | `string` | n/a | yes |
| <a name="input_vpn_gateway"></a> [vpn\_gateway](#input\_vpn\_gateway) | n/a | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_private_azs"></a> [private\_azs](#output\_private\_azs) | Subnet AZs |
| <a name="output_private_cidrs"></a> [private\_cidrs](#output\_private\_cidrs) | List of cidr\_blocks |
| <a name="output_private_route_tables"></a> [private\_route\_tables](#output\_private\_route\_tables) | n/a |
| <a name="output_private_subnets"></a> [private\_subnets](#output\_private\_subnets) | List of Subnet ids |
<!-- END_TF_DOCS -->
