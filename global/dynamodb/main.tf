provider "aws" {
  region = "eu-west-3"
  profile ="sirinekloud"
  
}
resource "aws_dynamodb_table" "terraform_locks_prod" {
  name         = "terraform-up-and-running-locks_prod"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }
}

resource "aws_dynamodb_table" "terraform_locks_stage" {
  name         = "terraform-up-and-running-locks-stage"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }
}
