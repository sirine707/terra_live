provider "aws" {
  region = "eu-west-3"
  profile ="sirinekloud"
  
}
resource "aws_s3_bucket" "terraform_state_prod" {
  bucket = "terraform-up-and-running-coolstuff-prod"
 
  # Prevent accidental deletion of this S3 bucket
  lifecycle {
    prevent_destroy = true
  }
}
resource "aws_s3_bucket_server_side_encryption_configuration" "default_prod" {
  bucket = aws_s3_bucket.terraform_state_prod.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}

resource "aws_s3_bucket_public_access_block" "public_access_prod" {
  bucket                  = aws_s3_bucket.terraform_state_prod.id
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}


resource "aws_s3_bucket" "terraform_state_stage" {
  bucket = "terraform-up-and-running-coolstuff-stage"
 
  # Prevent accidental deletion of this S3 bucket
  lifecycle {
    prevent_destroy = true
  }
}
resource "aws_s3_bucket_server_side_encryption_configuration" "default_stage" {
  bucket = aws_s3_bucket.terraform_state_stage.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}

resource "aws_s3_bucket_public_access_block" "public_access_stage" {
  bucket                  = aws_s3_bucket.terraform_state_stage.id
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}