data "aws_iam_policy_document" "kms_additional" {
  statement {
    sid = "KMSKeyManagementAdditional"
    principals {
      identifiers = ["arn:aws:iam::${data.aws_caller_identity.current.account_id}:root"]
      type        = "AWS"
    }
    actions = [
      "kms:UpdateKeyDescription",
      "kms:EnableKeyRotation",
    ]
    resources = var.resources
  }
}

data "aws_iam_policy_document" "kms_encryption" {
  statement {
    sid = "KMSEncryptionManagement"
    actions = [
      "kms:Encrypt",
      "kms:Decrypt",
    ]
    resources = var.resources
  }
}
