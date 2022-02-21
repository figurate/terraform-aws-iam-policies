data "aws_iam_policy_document" "s3_terraform_access" {
  statement {
    actions = [
      "s3:PutObject",
      "s3:GetObject",
      "s3:DeleteObject"
    ]
    resources = var.resources
  }
  statement {
    actions = [
      "s3:ListBucket"
    ]
    resources = var.resources
  }
}

data "aws_iam_policy_document" "dynamodb_terraform_access" {
  statement {
    actions = [
      "dynamodb:GetItem",
      "dynamodb:PutItem",
      "dynamodb:DeleteItem",
    ]
    resources = var.resources
  }
}
