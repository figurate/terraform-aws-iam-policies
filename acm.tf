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
  name        = "bedrock-acm-importcert"
  description = "Import certificates provisioned externally"
  policy      = data.aws_iam_policy_document.acm_import_certificate.json
}
