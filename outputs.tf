# output "target_policy_new_arn" {
#   value = module.target_setup.target_policy_arn
# }

output "target_policy_arn" {
  value = module.target_setup.target_policy_arn
}

output "target_role_arn" {
  value = module.target_setup.aws_iam_role.target_role.arn
}
# output "user_access_key_encrypted" {
#   value = module.access_setup.user_access_key_encrypted
# }