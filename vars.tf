variable "region" {
  description = "Selected AWS region"
}

variable "policies" {
  description = "Names of template policies to include for provisioning"
  default     = []
}

variable "name_prefix" {
  description = "A prefix added to all IAM policy names"
  default     = ""
}

variable "assume_role_filter" {
  description = "Filter the IAM roles that may be assumed (applicable for IAM-related policies)"
  default     = "*"
}
