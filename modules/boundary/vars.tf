variable "policies" {
  description = "Names of predefined policies to include"
  default     = ["poweruser_boundary_policy"]
}

variable "resources" {
  description = "Target resources applicable for the provisioned policies"
  default     = ["*"]
}

variable "name_prefix" {
  description = "A prefix added to all IAM policy names"
  default     = ""
}
