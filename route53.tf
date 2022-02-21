data "aws_iam_policy_document" "route53_additional" {
  statement {
    sid = "Route53ZoneManagementAdditional"
    actions = [
      "route53:GetChange",
      "route53:GetHostedZone",
      "route53:ListTagsForResource",
    ]
    resources = var.resources
  }
}
