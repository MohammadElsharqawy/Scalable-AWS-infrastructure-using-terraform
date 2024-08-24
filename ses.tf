resource "aws_ses_email_identity" "semplates_email_identity" {
  email = var.verified_email
}