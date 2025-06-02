resource "aws_s3_bucket" "devopstrains3" {
  bucket        = "devopstrains3"
  force_destroy = true
}
