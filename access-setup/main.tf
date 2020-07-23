provider "aws" {
  region = var.aws_region
  profile = var.aws_profile
}

resource "aws_iam_user" "user" {

  count = var.existing_user ? 0 : 1

  name = var.user_name
  path = var.user_path
}

resource "aws_iam_access_key" "user_access_key" {
  count = var.existing_user ? 0 : 1

  user = aws_iam_user.user[0].name
}


resource "aws_iam_group" "access_group" {
  name = var.access_group_name
  path = var.access_group_path
}

resource "aws_iam_user_group_membership" "access_group_membership" {
  user = var.user_name

  groups = [
    "${aws_iam_group.access_group.name}",
  ]
}



resource "aws_iam_policy" "allow_sts_policy" {

  name        = var.allow_sts_policy_name
  path        = "/"
  description = "managed by terraform"

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": {
    "Effect": "Allow",
    "Action": "sts:AssumeRole",
    "Resource": "${var.target_policy_arn}"
  }
}
EOF
}



resource "aws_iam_group_policy_attachment" "policy_attachment" {
  group      = aws_iam_group.access_group.name
  policy_arn = aws_iam_policy.allow_sts_policy.arn
}