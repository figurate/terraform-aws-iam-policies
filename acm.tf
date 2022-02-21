data "aws_iam_policy_document" "acm_import_certificate" {
  statement {
    actions = [
      "acm:ImportCertificate",
      "acm:DescribeCertificate",
      "acm:ListTagsForCertificate",
#      "acm:DeleteCertificate",
    ]
    resources = var.resources
    condition {
      test     = "StringEquals"
      values   = [var.region]
      variable = "aws:RequestedRegion"
    }
  }
}
