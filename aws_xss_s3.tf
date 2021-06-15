resource "aws_s3_bucket" "eccschema" {
  bucket = "eccschema"
  acl    = "public-read"

  tags = {
    Name        = "eccschema"
    Environment = "test"
  }
}
