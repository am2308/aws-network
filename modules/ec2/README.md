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
| [aws_eip.default-ec2-private-ip](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/eip) | resource |
| [aws_instance.default-ec2](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/instance) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_ami"></a> [ami](#input\_ami) | ami for ec2 | `string` | n/a | yes |
| <a name="input_delete_termination"></a> [delete\_termination](#input\_delete\_termination) | Flag for EBS to be deleted when instance terminates | `bool` | n/a | yes |
| <a name="input_instance_name"></a> [instance\_name](#input\_instance\_name) | Name of the instance | `string` | n/a | yes |
| <a name="input_instance_type"></a> [instance\_type](#input\_instance\_type) | Type of the instance | `string` | n/a | yes |
| <a name="input_monitoring_enable"></a> [monitoring\_enable](#input\_monitoring\_enable) | flag for enhanced monitoring | `bool` | n/a | yes |
| <a name="input_security_group_id"></a> [security\_group\_id](#input\_security\_group\_id) | security group to attch with ec2 | `string` | n/a | yes |
| <a name="input_size_ebs"></a> [size\_ebs](#input\_size\_ebs) | size of ebs | `number` | n/a | yes |
| <a name="input_subnet_id"></a> [subnet\_id](#input\_subnet\_id) | subnet where ec2 needs to be provisioned | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | n/a | `map(string)` | n/a | yes |
| <a name="input_type_ebs"></a> [type\_ebs](#input\_type\_ebs) | type of ebs | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_private_ip"></a> [private\_ip](#output\_private\_ip) | n/a |
<!-- END_TF_DOCS -->
