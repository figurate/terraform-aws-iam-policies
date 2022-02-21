module "policies" {
  source = "../.."

  policies           = var.policies
  name_prefix        = var.name_prefix
  assume_role_filter = var.assume_role_filter
}
