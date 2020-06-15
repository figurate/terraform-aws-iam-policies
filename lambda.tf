data "aws_iam_policy_document" "lambda_config" {
  statement {
    actions   = ["lambda:GetFunction*"]
    resources = ["*"]
  }
}
