

# Archiving for python file
data "archive_file" "archive_python_code" {
  type        = "zip"
  source_dir  = "${path.module}/python/"
  output_path = "${path.module}/python/python-lambda.zip"
}


resource "aws_lambda_function" "terraform_lambda_func" {
  filename         = data.archive_file.archive_python_code.output_path
  function_name    = "lambda-ses"
  role             = aws_iam_role.lambda_role.arn
  handler          = "index.lambda_handler"
  runtime          = "python3.8"
  source_code_hash = data.archive_file.archive_python_code.output_base64sha256
  depends_on       = [aws_iam_role_policy_attachment.attach_iam_policy_to_iam_role]

}


# Creating event to trigger lamda function
resource "aws_s3_bucket_notification" "bucket_notification" {
  bucket = "elsharq-terraform-bucket"

  lambda_function {
    lambda_function_arn = aws_lambda_function.terraform_lambda_func.arn
    events              = ["s3:ObjectCreated:*", "s3:ObjectRemoved:*"]
  }

  depends_on = [aws_lambda_permission.allow_s3_to_invoke_lambda]

}

resource "aws_lambda_permission" "allow_s3_to_invoke_lambda" {
  statement_id  = "AllowS3InvokeLambda"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.terraform_lambda_func.arn
  principal     = "s3.amazonaws.com"
  source_arn    = "arn:aws:s3:::elsharq-terraform-bucket"

}

