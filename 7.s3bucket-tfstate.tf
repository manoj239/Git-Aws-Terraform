#resource "aws_s3_bucket" "devopspracticestatefile" {
#  bucket = "devopspracticestatefile"
#
#  tags = {
#    Name        = "devopspracticestatefile"
#    Environment = "var.environment"
#  }
#}
#
#resource "aws_dynamodb_table" "Devops-terraform-locks" {
#  name         = "Devops-terraform-locks"
#  billing_mode = "PAY_PER_REQUEST"
#  hash_key     = "LockID"
#
#  attribute {
#    name = "LockID"
#    type = "S"
#  }
#}