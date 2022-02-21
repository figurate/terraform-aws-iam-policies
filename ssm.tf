data "aws_iam_policy_document" "ssm_params" {
  statement {
    sid = "SSMParameterStoreManagement"
    actions = [
      "ssm:PutParameter",
      "ssm:DeleteParameter",
      "ssm:AddTagsToResource",
      "ssm:RemoveTagsFromResource",
    ]
    resources = var.resources
  }
}
