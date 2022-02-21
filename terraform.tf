data "aws_iam_policy_document" "s3_terraform_access" {
  statement {
    sid = "S3TerraformStateManagement"
    actions = [
      "s3:PutObject",
      "s3:GetObject",
      "s3:DeleteObject"
    ]
    resources = var.resources
  }
  statement {
    sid = "S3"
    actions = [
      "s3:ListBucket"
    ]
    resources = var.resources
  }
}

data "aws_iam_policy_document" "dynamodb_terraform_access" {
  statement {
    sid = "DynamoDBTerraformLockManagement"
    actions = [
      "dynamodb:GetItem",
      "dynamodb:PutItem",
      "dynamodb:DeleteItem",
    ]
    resources = var.resources
  }
}
