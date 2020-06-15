output policy_arns {
  value = aws_iam_policy.policies.*.arn
}
