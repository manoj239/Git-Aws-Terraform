resource "aws_s3_bucket" "devopspracticestatefile" {
  bucket = "devopspracticestatefile"

  tags = {
    Name        = "devopspracticestatefile"
    Environment = "var.environment"
  }
}