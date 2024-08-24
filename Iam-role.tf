
# Creating iam-role for lamda function
resource "aws_iam_role" "lambda_role" {
  name = "lambda_role"

  assume_role_policy = jsonencode(
    {
      "Version" : "2012-10-17",
      "Statement" : [
        {
          "Effect" : "Allow",
          "Action" : "sts:AssumeRole",
          "Principal" : {
            "Service" : "lambda.amazonaws.com"
          }
        }
      ]
  })

}


# Creating the policy for lambda function
resource "aws_iam_policy" "iam_policy_for_lambda" {
  name        = "lambda_policy"
  path        = "/"
  description = "AWS IAM Policy for managing aws lambda role on ses"

  policy = jsonencode(
    {
      "Version" : "2012-10-17",
      "Statement" : [
        {
          "Effect" : "Allow",
          "Action" : [
            "ses:SendEmail",
            "ses:SendRawEmail"
          ],
          "Resource" : "*"
        },
        {
          "Effect" : "Allow",
          "Action" : [
            "s3:*"
          ],
          "Resource" : [
            "arn:aws:s3:::elsharq-terraform-bucket-bucket",
            "arn:aws:s3:::elsharq-terraform-bucket-bucket/*"
          ]
        }

      ]
    }
  )
}


# Attach Iam policy to role
resource "aws_iam_role_policy_attachment" "attach_iam_policy_to_iam_role" {
  role       = aws_iam_role.lambda_role.name
  policy_arn = aws_iam_policy.iam_policy_for_lambda.arn
}



