data "aws_iam_policy_document" "application_autoscaling_fullaccess" {
  statement {
    actions = [
      "application-autoscaling:*",
    ]
    resources = ["*"]
  }
}

resource "aws_iam_policy" "application_autoscaling_fullaccess" {
  name        = "bedrock-appautoscaling-fullaccess"
  description = "Allow full control over application autoscaling"
  policy      = data.aws_iam_policy_document.application_autoscaling_fullaccess.json
}
