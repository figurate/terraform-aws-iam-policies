## Requirements

No requirements.

## Providers

No provider.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| assume\_role\_filter | Filter the IAM roles that may be assumed | `string` | `"*"` | no |
| name\_prefix | A prefix added to all IAM policy names | `string` | `""` | no |
| policies | Names of predefined policies to include | `list` | <pre>[<br>  "acm-certificate-import",<br>  "application-autoscaling-fullaccess",<br>  "cloudformation-stack-management",<br>  "cloudwatch-log-management",<br>  "cloudwatch-log-group-management",<br>  "codebuild-vpc-management",<br>  "dynamodb-fullaccess",<br>  "ec2-subnet-management",<br>  "ec2-security-group-management",<br>  "iam-access-key-rotation",<br>  "iam-assumerole-account",<br>  "iam-group-management",<br>  "iam-instance-profile-fullaccess",<br>  "iam-passrole-account",<br>  "iam-passrole-cloudformation",<br>  "iam-poweruser-boundary",<br>  "iam-service-linked-role-create",<br>  "kms-key-management",<br>  "kms-encryption-management",<br>  "lambda-config-management",<br>  "rds-instance-management",<br>  "route53-zone-readonly",<br>  "ssm-parameter-management",<br>  "terraform-state-management",<br>  "terraform-lock-management"<br>]</pre> | no |
| region | Selected AWS region | `any` | n/a | yes |

## Outputs

No output.

