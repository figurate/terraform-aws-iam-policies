/**
 * # AWS IAM role configuration
 *
 * Purpose: Provision IAM roles in AWS.
 *
 * Rationale: Bedrock blueprints use IAM roles to restrict the privileges of the provisioner.
 *
 * This script will create a role that has the following privileges:
 *
 * * IAM access to assume other IAM roles specific a blueprint
 * * Access to read/write Terraform state associated with the account
 * * Access to manage Terraform state locks associated with the blueprint
 */
data "aws_caller_identity" "current" {}
