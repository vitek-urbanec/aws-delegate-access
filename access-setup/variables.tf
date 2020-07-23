variable "aws_profile" {}
variable "aws_region" {}
variable "access_group_name" {}
variable "access_group_path" {}
variable "allow_sts_policy_name" {}
variable "target_policy_arn" {}
variable "user_name" {}
variable "existing_user" {}
variable "user_path" {}

# variable "using_managed_policy" {
#     description = "if true, existing managed policy will be used"
#     type = bool
#     default = false
# }

# variable "target_policy_managed_arn" {}

# variable "managed_policy_name" {
#     description = "name of the managed policy"
#     default = ""
# }