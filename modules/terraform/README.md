Policies to support an S3 backend for Terraform state storage.

## Requirements

No requirements.

## Providers

No provider.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| name\_prefix | A prefix added to all IAM policy names | `string` | `""` | no |
| policies | Names of predefined policies to include | `list` | <pre>[<br>  "s3_terraform_access",<br>  "dynamodb_terraform_access"<br>]</pre> | no |
| region | Selected AWS region | `any` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| policy\_arns | n/a |

