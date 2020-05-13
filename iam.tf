data "aws_iam_policy_document" "iam_passrole_policy" {
  statement {
    actions   = ["iam:PassRole"]
    resources = ["arn:aws:iam::${data.aws_caller_identity.current.account_id}:role/*"]
  }
}

data "aws_iam_policy_document" "cloudformation_passrole_policy" {
  statement {
    actions   = ["iam:PassRole"]
    resources = ["arn:aws:iam::${data.aws_caller_identity.current.account_id}:role/*-cloudformation-role"]
  }
}

data "aws_iam_policy_document" "iam_keyrotation" {
  statement {
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
    actions   = ["iam:CreateServiceLinkedRole"]
    resources = ["*"]
  }
}

data "aws_iam_policy_document" "iam_assumerole" {
  statement {
    actions   = ["iam:ListRoles"]
    resources = ["*"]
  }
  statement {
    actions   = ["sts:AssumeRole"]
    resources = ["arn:aws:iam::${data.aws_caller_identity.current.account_id}:role/${var.assume_role_filter}"]
  }
}

data "aws_iam_policy_document" "iam_groupadmin" {
  statement {
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

resource "aws_iam_policy" "iam_passrole" {
  name        = join("-", compact([var.name_prefix, "iam-passrole-account"]))
  description = "Deprecated: use bedrock-cloudformation-passrole"
  policy      = data.aws_iam_policy_document.iam_passrole_policy.json
}

resource "aws_iam_policy" "cloudformation_passrole" {
  name        = join("-", compact([var.name_prefix, "iam-passrole-cloudformation"]))
  description = "Permission to pass role to cloudformation"
  policy      = data.aws_iam_policy_document.cloudformation_passrole_policy.json
}

resource "aws_iam_policy" "iam_keyrotation" {
  name        = join("-", compact([var.name_prefix, "iam-access-key-rotation"]))
  description = "Manage IAM access keys"
  policy      = data.aws_iam_policy_document.iam_keyrotation.json
}

resource "aws_iam_policy" "iam_servicerole_create" {
  name        = join("-", compact([var.name_prefix, "iam-service-linked-role-create"]))
  description = "Create IAM service-linked roles"
  policy      = data.aws_iam_policy_document.iam_servicerole_create.json
}

resource "aws_iam_policy" "iam_assumerole" {
  name        = join("-", compact([var.name_prefix, "iam-assumerole-account"]))
  description = "Assume blueprint IAM roles"
  policy      = data.aws_iam_policy_document.iam_assumerole.json
}

resource "aws_iam_policy" "iam_groupadmin" {
  name        = join("-", compact([var.name_prefix, "iam-group-management"]))
  description = "Manage IAM user groups"
  policy      = data.aws_iam_policy_document.iam_groupadmin.json
}

resource "aws_iam_policy" "iam_instance_profile" {
  name        = join("-", compact([var.name_prefix, "iam-instance-profile-fullaccess"]))
  description = "Manage IAM instance profiles"
  policy      = data.aws_iam_policy_document.instance_profile_fullaccess.json
}
