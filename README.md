
Changes Needed
1. Create a new variable named as 'tags' it should have created by, created via - using maps - Done
2. All cidr blocks should be from variable - Done
3. Replace hyphen with underscore in names - this is standard - Done
4. For availability zone instead of using it static, use AWS AZ data from terraform to fetch directly - https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/availability_zones - Done
5. Description - it should be a sentence E.g. Creating VPC for Global Tech - Done
6. Project name 'gtech' & environment 'dev' can be fetched from variable


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
| [aws_internet_gateway.gtech_dev_igw](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/internet_gateway) | resource |
| [aws_route_table.gtech_dev_pub_rt](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table) | resource |
| [aws_route_table_association.gtech_dev_pub_rt_association_1](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table_association) | resource |
| [aws_route_table_association.gtech_dev_pub_rt_association_2](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table_association) | resource |
| [aws_subnet.gtech_dev_priv_sub_1](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet) | resource |
| [aws_subnet.gtech_dev_priv_sub_2](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet) | resource |
| [aws_subnet.gtech_dev_pub_sub_1](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet) | resource |
| [aws_subnet.gtech_dev_pub_sub_2](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet) | resource |
| [aws_vpc.gtech_dev_vpc](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc) | resource |
| [aws_availability_zones.available_zones](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/availability_zones) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cidr_prv1"></a> [cidr\_prv1](#input\_cidr\_prv1) | CIDR Block for Private Subnet 1 | `string` | `"10.0.0.0/24"` | no |
| <a name="input_cidr_prv2"></a> [cidr\_prv2](#input\_cidr\_prv2) | CIDR Block for Private Subnet 2 | `string` | `"10.1.0.0/24"` | no |
| <a name="input_cidr_pub1"></a> [cidr\_pub1](#input\_cidr\_pub1) | CIDR Block for Public Subnet 1 | `string` | `"10.2.0.0/24"` | no |
| <a name="input_cidr_pub2"></a> [cidr\_pub2](#input\_cidr\_pub2) | CIDR Block for PriPublic Subnet 2 | `string` | `"10.3.0.0/24"` | no |
| <a name="input_cidr_vpc"></a> [cidr\_vpc](#input\_cidr\_vpc) | CIDR Block for VPC | `string` | `"10.0.0.0/16"` | no |
| <a name="input_environment"></a> [environment](#input\_environment) | Project Environment | `string` | `"dev"` | no |
| <a name="input_project_name"></a> [project\_name](#input\_project\_name) | Project Name | `string` | `"gtech"` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | Created by and Created via tags | `map` | <pre>{<br>  "created_by": "blessenpeter",<br>  "created_via": "terraform"<br>}</pre> | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_az_data"></a> [az\_data](#output\_az\_data) | AVAILABILITY ZONES |
