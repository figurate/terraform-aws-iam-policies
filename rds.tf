data "aws_iam_policy_document" "rds_admin" {
  statement {
    sid = "RDSInstanceManagement"
    principals {
      identifiers = ["arn:aws:iam::${data.aws_caller_identity.current.account_id}:root"]
      type        = "AWS"
    }
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
