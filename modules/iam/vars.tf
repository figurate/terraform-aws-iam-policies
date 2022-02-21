variable "policies" {
  description = "Names of predefined policies to include"
  default = [
    "iam_passrole_policy",
    "cloudformation_passrole_policy",
    "iam_keyrotation",
    "iam_servicerole_create",
    "iam_assumerole",
    "iam_groupadmin",
    "instance_profile_fullaccess",
  ]
}

variable "resources" {
  description = "Target resources applicable for the provisioned policies"
  default     = ["*"]
}

variable "name_prefix" {
  description = "A prefix added to all IAM policy names"
  default     = ""
}

variable "assume_role_filter" {
  description = "Filter the IAM roles that may be assumed"
  default     = "*"
}
