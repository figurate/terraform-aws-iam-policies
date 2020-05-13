data "aws_iam_policy_document" "acm_import_certificate" {
  statement {
    actions = [
      "acm:ImportCertificate",
      "acm:DescribeCertificate",
      "acm:ListTagsForCertificate",
      "acm:DeleteCertificate",
    ]
    resources = ["*"]
  }
}

resource "aws_iam_policy" "acm_import_certificate" {
  name        = join("-", compact([var.name_prefix, "acm-certificate-import"]))
  description = "Import certificates provisioned externally"
  policy      = data.aws_iam_policy_document.acm_import_certificate.json
}
