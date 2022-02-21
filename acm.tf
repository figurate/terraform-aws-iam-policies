data "aws_iam_policy_document" "acm_import_certificate" {
  statement {
    sid = "CertificateImportByUser"
    principals {
      identifiers = ["arn:aws:iam::${data.aws_caller_identity.current.account_id}:root"]
      type        = "AWS"
    }
    actions = [
      "acm:ImportCertificate",
      "acm:DescribeCertificate",
      "acm:ListTagsForCertificate",
      "acm:DeleteCertificate",
    ]
    resources = var.resources
#    condition {
#      test     = "StringEquals"
#      values   = [var.region]
#      variable = "aws:RequestedRegion"
#    }
  }
}
