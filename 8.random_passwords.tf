resource "aws_s3_bucket" "devopspracticestatefilenew" {
  bucket = "devopspracticestatefilenew"
  #
  tags = {
    Name        = "devopspracticestatefilenew"
    Environment = "var.environment"
  }
}

resource "random_password" "password-1" {
  length           = 16
  min_lower        = 4
  min_upper        = 4
  min_numeric      = 4
  min_special      = 4
  special          = true
  override_special = "!@$#"
  depends_on       = [aws_s3_bucket.devopspracticestatefilenew]
  lifecycle {
    create_before_destroy = true
  }
}

resource "random_password" "password-2" {
  length           = 16
  min_lower        = 4
  min_upper        = 4
  min_numeric      = 4
  min_special      = 4
  special          = true
  override_special = "!@$#"
  depends_on       = [random_password.password-1]
  lifecycle {
    create_before_destroy = true
  }
}

resource "random_password" "password-3" {
  length           = 16
  min_lower        = 4
  min_upper        = 4
  min_numeric      = 4
  min_special      = 4
  special          = true
  override_special = "!@$#"
  depends_on       = [random_password.password-2]
  lifecycle {
    create_before_destroy = true
  }
}

resource "random_password" "password-4" {
  length           = 16
  min_lower        = 4
  min_upper        = 4
  min_numeric      = 4
  min_special      = 4
  special          = true
  override_special = "!@$#"
  depends_on       = [random_password.password-3]
  lifecycle {
    create_before_destroy = true
  }
}

resource "random_password" "password-5" {
  length           = 16
  min_lower        = 4
  min_upper        = 4
  min_numeric      = 4
  min_special      = 4
  special          = true
  override_special = "!@$#"
  depends_on       = [random_password.password-4]
  lifecycle {
    create_before_destroy = true
  }
}