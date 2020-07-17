module "target_setup" {
    source = "./target-setup"
    
    aws_profile = var.target_aws_profile
    aws_region = var.target_aws_region
    target_role_name = var.target_role_name
    target_policy_name = var.target_policy_name
    target_policy_path = var.target_policy_path
    target_policy_file = var.target_policy_file
    access_account_ID = var.access_account_ID
}

module "access_setup" {
    source = "./access-setup"
    
    aws_profile = var.access_aws_profile
    aws_region = var.access_aws_region
    user_name = var.user_name
    user_path = var.user_path
    allow_sts_policy_name = var.allow_sts_policy_name
    access_group_name = var.access_group_name
    access_group_path = var.access_group_path
    target_policy_arn = module.target_setup.target_policy_arn
}