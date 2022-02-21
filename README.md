# ![AWS](aws-logo.png) IAM role configuration

Purpose: Provision additional IAM policies useful for common use-cases.

Rationale: Templated IAM policies promote consistency and privilege of least access.

## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| aws | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| assume\_role\_filter | Filter the IAM roles that may be assumed (applicable for IAM-related policies) | `string` | `"*"` | no |
| name\_prefix | A prefix added to all IAM policy names | `string` | `""` | no |
| policies | Names of template policies to include for provisioning | `list` | `[]` | no |
| resources | Target resources applicable for the provisioned policies | `list` | <pre>[<br>  "*"<br>]</pre> | no |

## Outputs

| Name | Description |
|------|-------------|
| policy\_arns | n/a |

