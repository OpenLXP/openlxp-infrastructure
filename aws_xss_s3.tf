resource "aws_s3_bucket" "openlxpschema" {
  bucket = "openlxpschema"
  acl    = "public-read"

  tags = {
    Name        = "openlxpschema"
    Environment = "test"
  }
}
