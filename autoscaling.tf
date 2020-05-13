data "aws_iam_policy_document" "application_autoscaling_fullaccess" {
  statement {
    actions = [
      "application-autoscaling:*",
    ]
    resources = ["*"]
  }
}

resource "aws_iam_policy" "application_autoscaling_fullaccess" {
  name        = join("-", compact([var.name_prefix, "application-autoscaling-fullaccess"]))
  description = "Allow full control over application autoscaling"
  policy      = data.aws_iam_policy_document.application_autoscaling_fullaccess.json
}
