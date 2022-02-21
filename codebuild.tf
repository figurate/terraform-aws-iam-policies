data "aws_iam_policy_document" "codebuild_vpc" {
  statement {
    actions = [
      "ec2:CreateNetworkInterface",
      "ec2:DescribeDhcpOptions",
      "ec2:DescribeNetworkInterfaces",
      "ec2:DeleteNetworkInterface",
      "ec2:DescribeSubnets",
      "ec2:DescribeSecurityGroups",
      "ec2:DescribeVpcs",
    ]
    resources = var.resources
  }
  statement {
    actions   = ["ec2:CreateNetworkInterfacePermission"]
    resources = ["arn:aws:ec2:${var.region}:${data.aws_caller_identity.current.account_id}:network-interfaces/*"]
    condition {
      test     = "StringEquals"
      variable = "ec2:Subnet"
      values   = ["arn:aws:ec2:${var.region}:${data.aws_caller_identity.current.account_id}:subnet/*"]
    }
    condition {
      test     = "StringEquals"
      variable = "ec2:AuthorizedService"
      values   = ["codebuild.amazonaws.com"]
    }
  }
}
