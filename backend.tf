terraform {
  backend "s3" {
    bucket         = "elsharq-terraform-bucket"
    key            = "terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "dynamo-lock-table"
  }
}
