# ![AWS](aws-logo.png) IAM role configuration

Purpose: Provision IAM roles in AWS.

Rationale: Bedrock blueprints use IAM roles to restrict the privileges of the provisioner.

This script will create a role that has the following privileges:

* IAM access to assume other IAM roles specific a blueprint
* Access to read/write Terraform state associated with the account
* Access to manage Terraform state locks associated with the blueprint

## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| aws | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| assume\_role\_filter | Filter the IAM roles that may be assumed | `string` | `"*"` | no |
| name\_prefix | A prefix added to all IAM policy names | `string` | `""` | no |
| policies | Names of predefined policies to include | `list` | `[]` | no |
| region | Selected AWS region | `any` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| policy\_arns | n/a |

