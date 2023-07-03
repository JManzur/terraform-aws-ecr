# AWS ECR Terraform module.

This Terraform module provides an easy-to-use solution to deploy AWS Elastic Container Registry (ECR) repositories, with customizable settings such as encryption, lifecycle policy, replication (cross-region and cross-account).

## How to use this modue:

```bash
module "aws-ecr" {
  source = "https://dev.azure.com/edmentum/ED/_git/terraform-aws-ecr?ref=v1.0.0"

  # Required variables:
  name_prefix = "si"
  app_list = [
    {
      name                = "app1"
      tag_mutability      = "MUTABLE"
      replication_enabled = true
      replica_destination = [
        {
          region     = "us-east-2"
          account_id = "self"
        }
      ]
    },
    {
      name                = "app2"
      tag_mutability      = "IMMUTABLE"
      replication_enabled = false
    }
  ]

  # Optional variables:
  encryption_configuration = "KMS"
  scanning_config = {
    "type"      = "ENHANCED"
    "frequency" = "CONTINUOUS_SCAN"
    "filter"    = "app*"
  }
  force_delete = true
  images_to_keep = 10
}
```
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 4.0.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 4.61.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_ecr_lifecycle_policy.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecr_lifecycle_policy) | resource |
| [aws_ecr_registry_scanning_configuration.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecr_registry_scanning_configuration) | resource |
| [aws_ecr_replication_configuration.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecr_replication_configuration) | resource |
| [aws_ecr_repository.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecr_repository) | resource |
| [aws_kms_alias.ecr_encryption](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/kms_alias) | resource |
| [aws_kms_key.ecr_encryption](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/kms_key) | resource |
| [aws_caller_identity.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/caller_identity) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_app_list"></a> [app\_list](#input\_app\_list) | [REQUIRED] List of applications to create ECR repositories for. | <pre>list(object({<br>    name                = string<br>    tag_mutability      = string<br>    replication_enabled = bool<br>    replica_destination = optional(list(object({<br>      region     = string<br>      account_id = string<br>    })))<br>  }))</pre> | n/a | yes |
| <a name="input_encryption_configuration"></a> [encryption\_configuration](#input\_encryption\_configuration) | [OPTIONAL] The encryption configuration for the repository. Valid values are AES256 or KMS. | `string` | `"AES256"` | no |
| <a name="input_force_delete"></a> [force\_delete](#input\_force\_delete) | [OPTIONAL] When set to true, executing 'terraform destroy' will remove all images from the repository. | `bool` | `false` | no |
| <a name="input_images_to_keep"></a> [images\_to\_keep](#input\_images\_to\_keep) | [OPTIONAL] The number of images to retain in the repository. | `number` | `30` | no |
| <a name="input_name_prefix"></a> [name\_prefix](#input\_name\_prefix) | [REQUIRED] Used to name and tag resources. | `string` | n/a | yes |
| <a name="input_scanning_config"></a> [scanning\_config](#input\_scanning\_config) | [OPTIONAL] The scanning configuration for the repository. | `map(string)` | <pre>{<br>  "filter": "*",<br>  "frequency": "SCAN_ON_PUSH",<br>  "type": "BASIC"<br>}</pre> | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_repository_arn"></a> [repository\_arn](#output\_repository\_arn) | The ARN of the ECR Repository |
| <a name="output_repository_url"></a> [repository\_url](#output\_repository\_url) | The URL of the ECR Repository |
<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 4.0.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 5.6.2 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_ecr_lifecycle_policy.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecr_lifecycle_policy) | resource |
| [aws_ecr_registry_scanning_configuration.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecr_registry_scanning_configuration) | resource |
| [aws_ecr_replication_configuration.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecr_replication_configuration) | resource |
| [aws_ecr_repository.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecr_repository) | resource |
| [aws_kms_alias.ecr_encryption](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/kms_alias) | resource |
| [aws_kms_key.ecr_encryption](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/kms_key) | resource |
| [aws_caller_identity.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/caller_identity) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_app_list"></a> [app\_list](#input\_app\_list) | [REQUIRED] List of applications to create ECR repositories for. | <pre>list(object({<br>    name                = string<br>    tag_mutability      = string<br>    replication_enabled = bool<br>    replica_destination = optional(list(object({<br>      region     = string<br>      account_id = string<br>    })))<br>  }))</pre> | n/a | yes |
| <a name="input_encryption_configuration"></a> [encryption\_configuration](#input\_encryption\_configuration) | [OPTIONAL] The encryption configuration for the repository. Valid values are AES256 or KMS. | `string` | `"AES256"` | no |
| <a name="input_force_delete"></a> [force\_delete](#input\_force\_delete) | [OPTIONAL] When set to true, executing 'terraform destroy' will remove all images from the repository. | `bool` | `false` | no |
| <a name="input_images_to_keep"></a> [images\_to\_keep](#input\_images\_to\_keep) | [OPTIONAL] The number of images to retain in the repository. | `number` | `30` | no |
| <a name="input_name_prefix"></a> [name\_prefix](#input\_name\_prefix) | [REQUIRED] Used to name and tag resources. | `string` | n/a | yes |
| <a name="input_scanning_config"></a> [scanning\_config](#input\_scanning\_config) | [OPTIONAL] The scanning configuration for the repository. | `map(string)` | <pre>{<br>  "filter": "*",<br>  "frequency": "SCAN_ON_PUSH",<br>  "type": "BASIC"<br>}</pre> | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_repository_arn"></a> [repository\_arn](#output\_repository\_arn) | The ARN of the ECR Repository |
| <a name="output_repository_url"></a> [repository\_url](#output\_repository\_url) | The URL of the ECR Repository |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
