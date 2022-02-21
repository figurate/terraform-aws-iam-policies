variable "policies" {
  description = "Names of predefined policies to include"
  default = [
    "application-autoscaling-fullaccess",
    "codebuild-vpc-management",
    "iam-access-key-rotation",
    "iam-assumerole-account",
    "iam-group-management",
    "iam-instance-profile-fullaccess",
    "iam-passrole-account",
    "iam-passrole-cloudformation",
    "iam-poweruser-boundary",
    "lambda-config-management",
    "route53-zone-readonly",
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
