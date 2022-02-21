variable "policies" {
  description = "Names of predefined policies to include"
  default = [
    "acm-certificate-import",
    "application-autoscaling-fullaccess",
    "cloudformation-stack-management",
    "cloudwatch-log-management",
    "cloudwatch-log-group-management",
    "codebuild-vpc-management",
    "dynamodb-fullaccess",
    "ec2-subnet-management",
    "ec2-security-group-management",
    "iam-access-key-rotation",
    "iam-assumerole-account",
    "iam-group-management",
    "iam-instance-profile-fullaccess",
    "iam-passrole-account",
    "iam-passrole-cloudformation",
    "iam-poweruser-boundary",
    "iam-service-linked-role-create",
    "kms-key-management",
    "kms-encryption-management",
    "lambda-config-management",
    "rds-instance-management",
    "route53-zone-readonly",
    "ssm-parameter-management",
    "terraform-state-management",
    "terraform-lock-management"
  ]
}

variable "resources" {
  description = "Target resources applicable for the provisioned policies"
  default = ["*"]
}

variable "name_prefix" {
  description = "A prefix added to all IAM policy names"
  default     = ""
}

variable "assume_role_filter" {
  description = "Filter the IAM roles that may be assumed"
  default     = "*"
}
