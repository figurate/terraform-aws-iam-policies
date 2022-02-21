data "aws_iam_policy_document" "application_autoscaling_fullaccess" {
  statement {
    actions = [
      "application-autoscaling:*",
    ]
    resources = var.resources
  }
}
