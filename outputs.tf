output iam_assumerole_arn {
  value = aws_iam_policy.iam_assumerole.arn
}

output s3_terraform_access_arn {
  value = aws_iam_policy.s3_terraform_access.arn
}

output dynamodb_terraform_access_arn {
  value = aws_iam_policy.dynamodb_terraform_access.arn
}
