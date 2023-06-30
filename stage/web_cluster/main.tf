provider "aws" {
  region = "eu-west-3"
  profile ="sirinekloud"
  
}
terraform {
  backend "s3" {
    # Replace this with your bucket name!
    bucket         = "terraform-up-and-running-coolstuff-stage"
    key            = "global/s3/terraform.tfstate"
    region         = "eu-west-3"
    

    # Replace this with your DynamoDB table name!
    dynamodb_table = "terraform-up-and-running-locks-stage"
    encrypt        = true
  }
}


module "web_cluster" {
  source="../../modules/web_cluster"
  security_group_name= "terraform-SG-staging"
  asg_name= "terraformASG_stage"
  lt_name= "terraform_lt_stage"
}