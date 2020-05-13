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

resource "aws_iam_policy" "route53_zoneaccess" {
  name        = join("-", compact([var.name_prefix, "route53-zone-readonly"]))
  description = "Access Route53 zone metadata"
  policy      = data.aws_iam_policy_document.route53_additional.json
}
