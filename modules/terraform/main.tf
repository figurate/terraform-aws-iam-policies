/*
 * Policies to support an S3 backend for Terraform state storage.
 */
module "policies" {
  source = "../.."

  region      = var.region
  policies    = var.policies
  name_prefix = var.name_prefix
}
