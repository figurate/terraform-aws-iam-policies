/*
 * Policies to support an S3 backend for Terraform state storage.
 */
module "policies" {
  source = "../.."

  policies = var.policies
  resources = [
    "arn:aws:s3:::${var.state_bucket}*",
    "arn:aws:dynamodb:*:*:table/${var.lock_table}",
  ]
  name_prefix = var.name_prefix
}
