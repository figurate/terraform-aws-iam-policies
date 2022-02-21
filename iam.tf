data "aws_iam_policy_document" "iam_passrole_policy" {
  statement {
    sid       = "IAMPassRolePermission"
    actions   = ["iam:PassRole"]
    resources = ["arn:aws:iam::${data.aws_caller_identity.current.account_id}:role/*"]
  }
}

data "aws_iam_policy_document" "cloudformation_passrole_policy" {
  statement {
    sid       = "IAMPassRolePermissionForCloudFormation"
    actions   = ["iam:PassRole"]
    resources = ["arn:aws:iam::${data.aws_caller_identity.current.account_id}:role/*-cloudformation-role"]
  }
}

data "aws_iam_policy_document" "iam_keyrotation" {
  statement {
    sid = "IAMAccessKeyManagement"
    principals {
      identifiers = ["arn:aws:iam::${data.aws_caller_identity.current.account_id}:root"]
      type        = "AWS"
    }
    actions = [
      "iam:CreateAccessKey",
      "iam:DeleteAccessKey",
      "iam:UpdateAccessKey",
    ]
    resources = ["arn:aws:iam::${data.aws_caller_identity.current.account_id}:user/*"]
  }
}

data "aws_iam_policy_document" "iam_servicerole_create" {
  statement {
    sid       = "IAMServiceRoleCreation"
    actions   = ["iam:CreateServiceLinkedRole"]
    resources = var.resources
  }
}

data "aws_iam_policy_document" "iam_assumerole" {
  statement {
    sid       = "IAMListRolesPermission"
    actions   = ["iam:ListRoles"]
    resources = var.resources
  }
  statement {
    sid       = "IAMAssumeRolePermission"
    actions   = ["sts:AssumeRole"]
    resources = ["arn:aws:iam::${data.aws_caller_identity.current.account_id}:role/${var.assume_role_filter}"]
  }
}

data "aws_iam_policy_document" "iam_groupadmin" {
  statement {
    sid = "IAMGroupManagement"
    principals {
      identifiers = ["arn:aws:iam::${data.aws_caller_identity.current.account_id}:root"]
      type        = "AWS"
    }
    actions = [
      "iam:ListGroups",
      "iam:CreateGroup",
      "iam:DeleteGroup",
    ]
    resources = ["arn:aws:iam::${data.aws_caller_identity.current.account_id}:*"]
  }
}

data "aws_iam_policy_document" "instance_profile_fullaccess" {
  statement {
    sid = "IAMRoleManagement"
    principals {
      identifiers = ["arn:aws:iam::${data.aws_caller_identity.current.account_id}:root"]
      type        = "AWS"
    }
    actions = [
      "iam:GetRole",
      "iam:CreateRole",
      "iam:DeleteRole",
      "iam:AttachRolePolicy",
      "iam:DetachRolePolicy",
    ]
    resources = ["arn:aws:iam::${data.aws_caller_identity.current.account_id}:role/*"]
  }
  statement {
    sid = "IAMInstanceProfileManagement"
    principals {
      identifiers = ["arn:aws:iam::${data.aws_caller_identity.current.account_id}:root"]
      type        = "AWS"
    }
    actions = [
      "iam:CreateInstanceProfile",
      "iam:DeleteInstanceProfile",
      "iam:GetInstanceProfile",
      "iam:AddRoleToInstanceProfile",
      "iam:RemoveRoleFromInstanceProfile",
    ]
    resources = ["arn:aws:iam::${data.aws_caller_identity.current.account_id}:instance-profile/*"]
  }
}
