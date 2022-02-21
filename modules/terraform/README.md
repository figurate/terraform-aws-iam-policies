Policies to support an S3 backend for Terraform state storage.

## Requirements

No requirements.

## Providers

No provider.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| lock\_table | Name of the DynamoDB table used for Terraform lock | `string` | `"terraform-lock"` | no |
| name\_prefix | A prefix added to all IAM policy names | `string` | `""` | no |
| policies | Names of predefined policies to include | `list` | <pre>[<br>  "s3_terraform_access",<br>  "dynamodb_terraform_access"<br>]</pre> | no |
| state\_bucket | Name of the S3 bucket used for Terraform state | `string` | `"terraform-state"` | no |

## Outputs

| Name | Description |
|------|-------------|
| policy\_arns | n/a |

