resource "aws_s3_bucket" "my_bukcet" {
  bucket = "terraform-gen-s3-bucket"

  tags = {
    Name        = "terraform-gen-s3-bucket"
    Environment = "Dev"
  }
}
