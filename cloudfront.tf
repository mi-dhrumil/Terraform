resource "aws_cloudfront_origin_access_identity" "example" {
  comment = "Some comment"
}

data "aws_cloudfront_cache_policy" "cache_policy" {
    name =  "Managed-CachingOptimized"
}
resource "aws_cloudfront_distribution" "s3_distribution" {
  origin {
    domain_name              = aws_s3_bucket.example_bucket.bucket_regional_domain_name
    origin_id                = local.s3_origin_id
    s3_origin_config {
      origin_access_identity = aws_cloudfront_origin_access_identity.example.cloudfront_access_identity_path
      
    }

  }
      aliases = [var.clouidfront_alias]
      enabled             = true
    custom_error_response {
      error_code             = 403  # Replace with the desired error code
      response_code          = 200  # Replace with the HTTP response code
      response_page_path     = "/index.html"  # Replace with the path to your custom error page
      error_caching_min_ttl = 0  # Replace with the desired caching time
    }

  default_cache_behavior {
    allowed_methods  = ["DELETE", "GET", "HEAD", "OPTIONS", "PATCH", "POST", "PUT"]
    cached_methods   = ["GET", "HEAD"]
    target_origin_id = local.s3_origin_id
    cache_policy_id = data.aws_cloudfront_cache_policy.cache_policy.id



    viewer_protocol_policy = "redirect-to-https"
    min_ttl                = 0
    default_ttl            = 3600
    max_ttl                = 86400
  }


  restrictions {
    geo_restriction {
      restriction_type = "none"
    }
  }

  tags = {
    Environment = "staging"
  }
  # viewer_certificate {
  #   cloudfront_default_certificate = true
  # }
  viewer_certificate {
    acm_certificate_arn = "arn:aws:acm:us-east-1:971167434350:certificate/f83f99f1-0404-4717-a6c0-3233ccd70c61"
    ssl_support_method = "sni-only"
  }
}

