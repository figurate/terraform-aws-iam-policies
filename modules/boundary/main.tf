module "policies" {
  source = "../.."

  policies    = var.policies
  name_prefix = var.name_prefix
}
