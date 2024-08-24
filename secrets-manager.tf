
resource "aws_secretsmanager_secret" "mysecret" {
  name                    = "mysecret"
  recovery_window_in_days = 0
}


resource "aws_secretsmanager_secret_version" "secret_version" {
  secret_id     = aws_secretsmanager_secret.mysecret.id
  secret_string = tls_private_key.key.private_key_pem
}

