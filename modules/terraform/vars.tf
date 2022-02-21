variable "region" {
  description = "Selected AWS region"
}

variable "policies" {
  description = "Names of predefined policies to include"
  default     = ["s3_terraform_access", "dynamodb_terraform_access"]
}

variable "name_prefix" {
  description = "A prefix added to all IAM policy names"
  default     = ""
}
