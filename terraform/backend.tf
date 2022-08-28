terraform {
  backend "s3" {
    # Replace this with your bucket name!
    bucket         = "terraform-up-and-running-state1111x"
    key            = "global/s3/terraform.tfstate"
    region         = "us-west-2"
    # Replace this with your DynamoDB table name!
    
    encrypt        = true
  }
}
