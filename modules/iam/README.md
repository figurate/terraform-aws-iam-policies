## Requirements

No requirements.

## Providers

No provider.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| assume\_role\_filter | Filter the IAM roles that may be assumed | `string` | `"*"` | no |
| name\_prefix | A prefix added to all IAM policy names | `string` | `""` | no |
| policies | Names of predefined policies to include | `list` | <pre>[<br>  "iam_passrole_policy",<br>  "cloudformation_passrole_policy",<br>  "iam_keyrotation",<br>  "iam_servicerole_create",<br>  "iam_assumerole",<br>  "iam_groupadmin",<br>  "instance_profile_fullaccess"<br>]</pre> | no |
| resources | Target resources applicable for the provisioned policies | `list` | <pre>[<br>  "*"<br>]</pre> | no |

## Outputs

| Name | Description |
|------|-------------|
| policy\_arns | n/a |

