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
    resources = ["*"]
  }
}

resource "aws_iam_policy" "rds_admin" {
  name        = join("-", compact([var.name_prefix, "rds-instance-management"]))
  description = "Manage power cycling RDS clusters and instances"
  policy      = data.aws_iam_policy_document.rds_admin.json
}
