provider "aws" {
  region  = "us-west-1"
  version = "~> 2.0"
}

resource "aws_s3_bucket" "bucket1" {
  bucket = "tf-test-bucket-udemy"
  acl    = "private"

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}

resource "aws_s3_bucket_object" "object1" {
  bucket = aws_s3_bucket.bucket1.id
  key    = "hello-world.txt"
  source = "./example.txt"
  etag = filemd5("./example.txt")
}

output "bucket" {
  value = aws_s3_bucket.bucket1.id
}

