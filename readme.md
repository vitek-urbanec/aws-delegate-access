# access permissions delegation setup via terraform

the module places user in a group to allow access via STS to the role in target account. in your root module, create a folder `./policies/` to place for your IAM policies definitions in JSON.

for EKS, the 

## usage example:

```
module "aws-delegate-access" {
    source = "github.com/vitek-urbanec/aws-delegate-access"
    
    target_aws_profile = "dev"
    target_aws_region = "eu-west-1"
    target_role_name = "eks-management-role"
    target_policy_name = "eks-management-policy"

    access_aws_profile = "access"
    access_aws_region = "eu-west-1"
    user_name = "random.dude"
    allow_sts_policy_name = "eks-management-dev-policy"
    access_group_name = "eks-management-dev-group"
    access_account_ID = "6666666666666"
    using_managed_policy = false
    managed_policy_name = "AdministratorAccess"
    target_policy_file = "eks_management.json"
}
```

## inputs:

`target_aws_profile`: where the resources are, AWS CLI profile to use for creating the IAM role & policy for accessing the resources

`target_aws_region`: self-explanatory

`target_role_name`: name of the role with the access to target resources  
`target_policy_name`: name of the policy to define access to the target resources

`access_aws_profile`: profile holding the user IAM

`access_aws_region`: self-explanatory  
`user_name`: name of the user in the access account  
`allow_sts_policy_name`: policy that explicitly allows the cross-account role-assume with STS  
`access_group_name`: name of the group of users eligible for the delegation access  
`access_account_ID`: ID of the access account  
`target_policy_file`: file in ./policies/ folder to be used for defining the target policy (accessing the actual resources)  