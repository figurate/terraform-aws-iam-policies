data "aws_iam_policy_document" "rds_admin" {
  statement {
    actions = [
      "rds:StopDBInstance",
      "rds:StartDBInstance",
      "rds:StopDBCluster",
      "rds:StartDBCluster",
      "logs:CreateLogGroup",
      "logs:CreateLogStream",
      "logs:PutLogEvents",
      "logs:DescribeLogStreams",
      "cloudwatch:Describe*",
    ]
    resources = var.resources
  }
}
