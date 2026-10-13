resource "aws_s3_bucket" "app_bucket" {
  bucket = "${var.env}-${var.bucket_name}"

  tags = {
    Name = "${var.env}-${var.bucket_name}"
    env = var.env
  }
}