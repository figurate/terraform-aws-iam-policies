module "policies" {
  source = "../.."

  policies    = var.policies
  resources   = var.resources
  name_prefix = var.name_prefix
}
