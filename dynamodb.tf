data "aws_iam_policy_document" "dynamodb_fullaccess" {
  statement {
    actions = [
      "dynamodb:List*",
      "dynamodb:Describe*",
      "dynamodb:Get*",
      "dynamodb:PutItem",
    ]
    resources = ["*"]
  }
}
