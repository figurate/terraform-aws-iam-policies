variable "region" {
  description = "Selected AWS region"
}

variable "policies" {
  description = "Names of predefined policies to include"
  default     = ["poweruser_boundary_policy"]
}

variable "name_prefix" {
  description = "A prefix added to all IAM policy names"
  default     = ""
}
