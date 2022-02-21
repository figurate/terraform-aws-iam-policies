module "policies" {
  source = "../.."

  region             = var.region
  policies           = var.policies
  name_prefix        = var.name_prefix
  assume_role_filter = var.assume_role_filter
}
