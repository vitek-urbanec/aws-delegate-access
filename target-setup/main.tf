provider "aws" {
  region = var.aws_region
  profile = var.aws_profile
}


resource "aws_iam_role" "target_role" {
  name = var.target_role_name
  assume_role_policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Principal": {
                "AWS": "arn:aws:iam::${var.access_account_ID}:root"
            },
            "Action": "sts:AssumeRole",
            "Condition": {}
        }
    ]
}
EOF
}

# new policy

resource "aws_iam_policy" "target_policy_new" {
  count = var.using_managed_policy ? 0 : 1
  name        = var.target_policy_name
  path        = var.target_policy_path
  description = "managed by terraform"
  policy      = file("./policies/${var.target_policy_file}")

}

resource "aws_iam_role_policy_attachment" "policy_attachment_new" {
  count = var.using_managed_policy ? 0 : 1
  role       = aws_iam_role.target_role.name
  policy_arn = aws_iam_policy.target_policy_new[0].arn
}

# managed policy

data "aws_iam_policy" "target_policy_managed" {
  count = var.using_managed_policy ? 1 : 0
  arn = "arn:aws:iam::aws:policy/${var.target_policy_name}"
}

resource "aws_iam_role_policy_attachment" "policy_attachment" {
  count = var.using_managed_policy ? 1 : 0
  role       = aws_iam_role.target_role.name
  policy_arn = data.aws_iam_policy.target_policy_managed[0].arn
}


# # if
# resource "aws_iam_user_policy_attachment" "neo_cloudwatch_full" {
#   count = var.give_neo_cloudwatch_full_access ? 1 : 0
#   user       = aws_iam_user.example[0].name
#   policy_arn = aws_iam_policy.cloudwatch_full_access.arn
# }
# # else
# resource "aws_iam_user_policy_attachment" "neo_cloudwatch_read" {
#   count = var.give_neo_cloudwatch_full_access ? 0 : 1
#   user       = aws_iam_user.example[0].name
#   policy_arn = aws_iam_policy.cloudwatch_read_only.arn
# }