data "aws_iam_policy_document" "ssm_params" {
  statement {
    actions = [
      "ssm:PutParameter",
      "ssm:DeleteParameter",
      "ssm:AddTagsToResource",
      "ssm:RemoveTagsFromResource",
    ]
    resources = ["*"]
  }
}

resource "aws_iam_policy" "ssm_params" {
  name        = join("-", compact([var.name_prefix, "ssm-parameter-management"]))
  description = "Manage configuration stored in Systems Manager Parameter Store"
  policy      = data.aws_iam_policy_document.ssm_params.json
}
