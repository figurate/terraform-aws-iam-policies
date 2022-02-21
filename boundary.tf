// When boundary policy is in use, don't allow IAM modifications unless boundary policy is also attached
// to target resources. This avoids bypass of boundary policies by creating new IAM user/roles..
data "aws_iam_policy_document" "poweruser_boundary_policy" {
  statement {
    sid         = "RestrictIAMWithoutBoundary"
    effect      = "Allow"
    not_actions = ["iam:*"]
    resources   = ["*"]
  }

  statement {
    sid    = "AllowIAMWithBoundary"
    effect = "Allow"
    actions = [
      "iam:CreateUser",
      "iam:DeleteUserPolicy",
      "iam:AttachUserPolicy",
      "iam:DetachUserPolicy",
      "iam:PutUserPermissionsBoundary",
      "iam:CreateRole",
      "iam:DeleteRolePolicy",
      "iam:AttachRolePolicy",
      "iam:DetachRolePolicy",
      "iam:PutRolePolicy",
      "iam:PutRolePermissionsBoundary",
    ]
    condition {
      test = "StringLike"
      values = [
        "arn:aws:iam::aws:policy/PowerUserAccess",
        "arn:aws:iam::${data.aws_caller_identity.current.account_id}:policy/poweruser_boundary_policy",
      ]
      variable = "iam:PermissionsBoundary"
    }
    resources = ["*"]
  }
}
