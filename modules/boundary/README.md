## Requirements

No requirements.

## Providers

No provider.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| name\_prefix | A prefix added to all IAM policy names | `string` | `""` | no |
| policies | Names of predefined policies to include | `list` | <pre>[<br>  "poweruser_boundary_policy"<br>]</pre> | no |
| resources | Target resources applicable for the provisioned policies | `list` | <pre>[<br>  "*"<br>]</pre> | no |

## Outputs

| Name | Description |
|------|-------------|
| policy\_arns | n/a |

