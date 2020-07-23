variable "target_aws_profile" {}
variable "target_aws_region" {}
variable "target_role_name" {}
variable "target_policy_name" {}
variable "target_policy_path" {
    default = "/"
}
variable "access_aws_profile" {}
variable "access_aws_region" {}
variable "user_name" {}
variable "existing_user" {
    type = bool
    default = false
}
variable "user_path" {
    default = "/"
}
variable "allow_sts_policy_name" {}
variable "access_group_name" {}
variable "access_group_path" {
    default = "/"
}
variable "target_policy_file" {}
variable "access_account_ID" {}
variable "using_managed_policy" {}
variable "managed_policy_name" {
    default = ""
}
