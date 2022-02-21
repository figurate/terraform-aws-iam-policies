data "aws_iam_policy_document" "lambda_config" {
  statement {
    sid = "LambdaConfigurationManagement"
    actions   = ["lambda:GetFunction*"]
    resources = var.resources
  }
}
