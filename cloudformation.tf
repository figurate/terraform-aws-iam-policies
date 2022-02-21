data "aws_iam_policy_document" "cloudformation_create_policy" {
  statement {
    sid = "CloudFormationStackManagement"
    principals {
      identifiers = ["arn:aws:iam::${data.aws_caller_identity.current.account_id}:root"]
      type        = "AWS"
    }
    actions = [
      "cloudformation:Create*",
      "cloudformation:Update*",
      "cloudformation:Delete*",
    ]
#    resources = ["arn:aws:cloudformation:${var.region}:${data.aws_caller_identity.current.account_id}:stack/*"]
    resources = var.resources
  }
}
