data "aws_iam_policy_document" "cloudwatch_logs" {
  statement {
    sid = "CloudWatchLogging"
    actions = [
      "logs:CreateLogStream",
      "logs:PutLogEvents",
      "logs:DescribeLogStreams",
    ]
    #    resources = ["arn:aws:logs:${data.aws_caller_identity.current.account_id}:log-group:*"]
    resources = var.resources
  }
}

data "aws_iam_policy_document" "cloudwatch_log_groups" {
  statement {
    sid = "CloudWatchLogGroupManagement"
    principals {
      identifiers = ["arn:aws:iam::${data.aws_caller_identity.current.account_id}:root"]
      type        = "AWS"
    }
    actions = [
      "logs:CreateLogGroup",
      "logs:DeleteLogGroup",
      "logs:DescribeLogGroups",
      "logs:PutRetentionPolicy",
    ]
    #    resources = ["arn:aws:logs:${var.region}:${data.aws_caller_identity.current.account_id}:*"]
    resources = var.resources
  }
}
