# output "target_policy_new_arn" {
#   value = aws_iam_policy.target_policy_new[0].arn
# }

# output "target_policy_managed_arn" {
#   value = data.aws_iam_policy.target_policy_managed[0].arn
# }

output "target_policy_arn" {
  # value = data.aws_iam_policy.target_policy_managed[0].arn ? aws_iam_policy.target_policy_new[0].arn : ""
  value = coalesce(join("", data.aws_iam_policy.target_policy_managed.*.arn), join("", aws_iam_policy.target_policy_new.*.arn))
}

output "target_role_arn" {
  value = aws_iam_role.target_role.arn
}