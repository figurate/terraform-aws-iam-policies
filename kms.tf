data "aws_iam_policy_document" "kms_additional" {
  statement {
    actions = [
      "kms:UpdateKeyDescription",
      "kms:EnableKeyRotation",
    ]
    resources = var.resources
  }
}

data "aws_iam_policy_document" "kms_encryption" {
  statement {
    actions = [
      "kms:Encrypt",
      "kms:Decrypt",
    ]
    resources = var.resources
  }
}
