data "aws_iam_policy_document" "route53_additional" {
  statement {
    actions = [
      "route53:GetChange",
      "route53:GetHostedZone",
      "route53:ListTagsForResource",
    ]
    resources = ["*"]
  }
}
