# AWS IAM role configuration

Purpose: Provision IAM roles in AWS.

Rationale: Bedrock blueprints use IAM roles to restrict the privileges of the provisioner.

This script will create a role that has the following privileges:

* IAM access to assume other IAM roles specific a blueprint
* Access to read/write Terraform state associated with the account
* Access to manage Terraform state locks associated with the blueprint

## Requirements

| Name | Version |
|------|---------|
| aws | >= 2.7.0 |

## Providers

| Name | Version |
|------|---------|
| aws | >= 2.7.0 |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| region | Selected AWS region | `any` | n/a | yes |

## Outputs

No output.

