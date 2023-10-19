resource "aws_s3_bucket" "example_bucket" {
  bucket = var.s3_bucket_name  # Replace with your desired bucket name

  # Other optional configurations can be added here (e.g., ACLs, tags, etc.)
}


# resource "aws_s3_bucket_acl" "b_acl" {
#   bucket = aws_s3_bucket.example_bucket.id
#   acl    = "private"
# }

locals {
  s3_origin_id = "myS3Origin"
}

resource "aws_s3_bucket_cors_configuration" "example_cors_rule" {
  bucket = aws_s3_bucket.example_bucket.id

  cors_rule {
    allowed_headers = ["*"]
    allowed_methods = ["PUT", "POST" , "GET" , "DELETE"]
    allowed_origins = ["*"]
    expose_headers  = [""]
    max_age_seconds = 3000
  }
}

resource "aws_s3_bucket_policy" "read_gitbook" {
  bucket = aws_s3_bucket.example_bucket.id
  policy = data.aws_iam_policy_document.read_gitbook_bucket.json
}
data "aws_iam_policy_document" "read_gitbook_bucket" {
  statement {
    actions   = ["s3:GetObject"]
    resources = ["${aws_s3_bucket.example_bucket.arn}/*"]

    principals {
      type        = "AWS"
      identifiers = [aws_cloudfront_origin_access_identity.example.iam_arn]
    }
  }

  statement {
    actions   = ["s3:ListBucket"]
    resources = [aws_s3_bucket.example_bucket.arn]

    principals {
      type        = "AWS"
      identifiers = [aws_cloudfront_origin_access_identity.example.iam_arn]
    }
  }
}