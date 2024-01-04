<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= v1.6.5 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 5.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 5.31.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_argocd"></a> [argocd](#module\_argocd) | ./modules/argocd | n/a |
| <a name="module_eks"></a> [eks](#module\_eks) | terraform-aws-modules/eks/aws | ~> 19.0 |
| <a name="module_rds"></a> [rds](#module\_rds) | ./modules/rds | n/a |
| <a name="module_vpc"></a> [vpc](#module\_vpc) | terraform-aws-modules/vpc/aws | n/a |

## Resources

| Name | Type |
|------|------|
| [aws_availability_zones.available](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/availability_zones) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_create_database_subnet_group"></a> [create\_database\_subnet\_group](#input\_create\_database\_subnet\_group) | Value to determine if to create a database subnet group | `bool` | `true` | no |
| <a name="input_database_subnets"></a> [database\_subnets](#input\_database\_subnets) | IP ranges for database subnets | `list(string)` | <pre>[<br>  "10.1.201.0/24",<br>  "10.1.202.0/24"<br>]</pre> | no |
| <a name="input_desired_node_count"></a> [desired\_node\_count](#input\_desired\_node\_count) | Amount of desired nodes to run | `number` | `2` | no |
| <a name="input_enable_nat_gateway"></a> [enable\_nat\_gateway](#input\_enable\_nat\_gateway) | Value to determine if to create a nat gateway | `bool` | `true` | no |
| <a name="input_environment"></a> [environment](#input\_environment) | Name of the environment | `string` | `"development"` | no |
| <a name="input_instance_types"></a> [instance\_types](#input\_instance\_types) | Instace types to be used in eks cluster | `list(string)` | <pre>[<br>  "t3.large"<br>]</pre> | no |
| <a name="input_k8s_version"></a> [k8s\_version](#input\_k8s\_version) | K8s version for EKS | `string` | `"1.28"` | no |
| <a name="input_max_node_count"></a> [max\_node\_count](#input\_max\_node\_count) | Maximum nodes to run | `number` | `4` | no |
| <a name="input_min_node_count"></a> [min\_node\_count](#input\_min\_node\_count) | Minimum nodes to run | `number` | `2` | no |
| <a name="input_private_subnets"></a> [private\_subnets](#input\_private\_subnets) | IP ranges for public subnets | `list(string)` | <pre>[<br>  "10.1.1.0/24",<br>  "10.1.2.0/24"<br>]</pre> | no |
| <a name="input_project_name"></a> [project\_name](#input\_project\_name) | Name of the project, to be used as a prefix for resource names | `string` | `"eks"` | no |
| <a name="input_public_subnets"></a> [public\_subnets](#input\_public\_subnets) | IP ranges for public subnets | `list(string)` | <pre>[<br>  "10.1.101.0/24",<br>  "10.1.102.0/24"<br>]</pre> | no |
| <a name="input_region"></a> [region](#input\_region) | Name of the aws region | `string` | `"us-east-1"` | no |
| <a name="input_vpc_cidr"></a> [vpc\_cidr](#input\_vpc\_cidr) | VPC cider to use | `string` | `"10.1.0.0/16"` | no |

## Outputs

No outputs.
<!-- END_TF_DOCS -->