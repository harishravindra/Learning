resource "aws_s3_bucket_versioning" "s3_bucket_vpc_test" {
  bucket = "terraform-s3-bucket-vpc"  # Enable versioning so we can see the full revision history of our
  

  versioning_configuration {
    status = "Enabled"
  }
  
}

