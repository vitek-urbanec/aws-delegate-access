output "user_access_key_encrypted" {
  value = aws_iam_access_key.user_access_key.encrypted_secret
}