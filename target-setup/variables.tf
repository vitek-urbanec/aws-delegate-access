variable "aws_region" {}
variable "aws_profile" {}
variable "target_role_name" {}
variable "target_policy_name" {}
variable "target_policy_path" {}
variable "target_policy_file" {}
variable "access_account_ID" {}

variable "using_managed_policy" {
    description = "if true, existing managed policy will be used"
    type = bool
    default = false
}

variable "managed_policy_name" {
    description = "name of the managed policy"
    default = ""
}