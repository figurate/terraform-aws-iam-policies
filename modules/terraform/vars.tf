variable "policies" {
  description = "Names of predefined policies to include"
  default     = ["s3_terraform_access", "dynamodb_terraform_access"]
}

variable "name_prefix" {
  description = "A prefix added to all IAM policy names"
  default     = ""
}

variable "state_bucket" {
  description = "Name of the S3 bucket used for Terraform state"
  default = "terraform-state"
}

variable "lock_table" {
  description = "Name of the DynamoDB table used for Terraform lock"
  default = "terraform-lock"
}
