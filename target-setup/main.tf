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

resource "aws_iam_policy" "target_policy" {
  name        = var.target_policy_name
  path        = var.target_policy_path
  description = "managed by terraform"
  policy      = file("./policies/${var.target_policy_file}")

}


resource "aws_iam_role_policy_attachment" "policy_attachment" {
  role       = aws_iam_role.target_role.name
  policy_arn = aws_iam_policy.target_policy.arn
}