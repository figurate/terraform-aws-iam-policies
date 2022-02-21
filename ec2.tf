data "aws_iam_policy_document" "ec2_subnet_fullaccess" {
  statement {
    actions = [
      "ec2:CreateSubnet",
      "ec2:DeleteSubnet",
      "ec2:DisassociateSubnetCidrBlock",
      "ec2:ModifySubnetAttribute",
      "ec2:DescribeSubnets",
      "ec2:AssociateSubnetCidrBlock",
      "ec2:CreateDefaultSubnet",
    ]
    resources = var.resources
  }
}

data "aws_iam_policy_document" "ec2_securitygroup_fullaccess" {
  statement {
    sid = "SecurityGroupManagement"
    principals {
      identifiers = ["arn:aws:iam::${data.aws_caller_identity.current.account_id}:root"]
      type        = "AWS"
    }
    actions = [
      "ec2:CreateSecurityGroup",
      "ec2:DeleteSecurityGroup",
      "ec2:AuthorizeSecurityGroup*",
      "ec2:RevokeSecurityGroup*",
      "ec2:UpdateSecurityGroupRuleDescriptions*",
      "ec2:CreateTags",
      "ec2:DeleteTags",
      "ec2:Describe*",
    ]
    resources = var.resources
  }
}
