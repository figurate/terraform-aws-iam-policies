/**
 * # ![AWS](aws-logo.png) IAM role configuration
 *
 * Purpose: Provision additional IAM policies useful for common use-cases.
 *
 * Rationale: Templated IAM policies promote consistency and privilege of least access.
 */
data "aws_caller_identity" "current" {}

locals {
  policies = {
    acm-certificate-import = {
      name        = "acm-certificate-import"
      description = "Import certificates provisioned externally"
      policy      = data.aws_iam_policy_document.acm_import_certificate
    }

    application-autoscaling-fullaccess = {
      name        = "application-autoscaling-fullaccess"
      description = "Allow full control over application autoscaling"
      policy      = data.aws_iam_policy_document.application_autoscaling_fullaccess
    }

    cloudformation-stack-management = {
      name        = "cloudformation-stack-management"
      description = "Manage CloudFormation stacks"
      policy      = data.aws_iam_policy_document.cloudformation_create_policy
    }

    cloudwatch-log-management = {
      name        = "cloudwatch-log-management"
      description = "Manage CloudWatch log entries"
      policy      = data.aws_iam_policy_document.cloudwatch_logs
    }

    cloudwatch-log-group-management = {
      name        = "cloudwatch-log-group-management"
      description = "Manage CloudWatch log groups"
      policy      = data.aws_iam_policy_document.cloudwatch_log_groups
    }

    codebuild-vpc-management = {
      name        = "codebuild-vpc-management"
      description = "Permissions required for CodeBuild to run in a VPC"
      policy      = data.aws_iam_policy_document.codebuild_vpc
    }

    dynamodb-fullaccess = {
      name        = "dynamodb-fullaccess"
      description = "Manage DynamoDB table entries"
      policy      = data.aws_iam_policy_document.dynamodb_fullaccess
    }

    ec2-subnet-management = {
      name        = "ec2-subnet-management"
      description = "Manage VPC Subnets"
      policy      = data.aws_iam_policy_document.ec2_subnet_fullaccess
    }

    ec2-security-group-management = {
      name        = "ec2-security-group-management"
      description = "Manage VPC Security Groups"
      policy      = data.aws_iam_policy_document.ec2_securitygroup_fullaccess
    }

    iam-access-key-rotation = {
      name        = "iam-access-key-rotation"
      description = "Manage IAM access keys"
      policy      = data.aws_iam_policy_document.iam_keyrotation
    }

    iam-assumerole-account = {
      name        = "iam-assumerole-account"
      description = "Assume blueprint IAM roles"
      policy      = data.aws_iam_policy_document.iam_assumerole
    }

    iam-group-management = {
      name        = "iam-group-management"
      description = "Manage IAM user groups"
      policy      = data.aws_iam_policy_document.iam_groupadmin
    }

    iam-instance-profile-fullaccess = {
      name        = "iam-instance-profile-fullaccess"
      description = "Manage IAM instance profiles"
      policy      = data.aws_iam_policy_document.instance_profile_fullaccess
    }

    iam-passrole-account = {
      name        = "iam-passrole-account"
      description = "Deprecated: use bedrock-cloudformation-passrole"
      policy      = data.aws_iam_policy_document.iam_passrole_policy
    }

    iam-passrole-cloudformation = {
      name        = "iam-passrole-cloudformation"
      description = "Permission to pass role to cloudformation"
      policy      = data.aws_iam_policy_document.cloudformation_passrole_policy
    }

    iam-poweruser-boundary = {
      name        = "iam-poweruser-boundary"
      description = "Restrict IAM functions to the specified region"
      policy      = data.aws_iam_policy_document.poweruser_boundary_policy
    }

    iam-service-linked-role-create = {
      name        = "iam-service-linked-role-create"
      description = "Create IAM service-linked roles"
      policy      = data.aws_iam_policy_document.iam_servicerole_create
    }

    kms-key-management = {
      name        = "kms-key-management"
      description = "Rotate KMS keys"
      policy      = data.aws_iam_policy_document.kms_additional
    }

    kms-encryption-management = {
      name        = "kms-encryption-management"
      description = "Encrypt/decrypt using KMS keys"
      policy      = data.aws_iam_policy_document.kms_encryption
    }

    lambda-config-management = {
      name        = "lambda-config-management"
      description = "Retrieve Lambda functions"
      policy      = data.aws_iam_policy_document.lambda_config
    }

    rds-instance-management = {
      name        = "rds-instance-management"
      description = "Manage power cycling RDS clusters and instances"
      policy      = data.aws_iam_policy_document.rds_admin
    }

    route53-zone-readonly = {
      name        = "route53-zone-readonly"
      description = "Access Route53 zone metadata"
      policy      = data.aws_iam_policy_document.route53_additional
    }

    ssm-parameter-management = {
      name        = "ssm-parameter-management"
      description = "Manage configuration stored in Systems Manager Parameter Store"
      policy      = data.aws_iam_policy_document.ssm_params
    }

    terraform-state-management = {
      name        = "terraform-state-management"
      description = "Manage persisted state for Terraform"
      policy      = data.aws_iam_policy_document.s3_terraform_access
    }

    terraform-lock-management = {
      name        = "terraform-lock-management"
      description = "Manage execution locking for Terraform"
      policy      = data.aws_iam_policy_document.dynamodb_terraform_access
    }
  }
}

resource "aws_iam_policy" "policies" {
  count       = length(var.policies)
  name        = join("-", compact([var.name_prefix, local.policies[var.policies[count.index]]["name"]]))
  description = local.policies[var.policies[count.index]]["description"]
  policy      = local.policies[var.policies[count.index]]["policy"].json
}
