# resource "aws_acm_certificate" "example" {
#   domain_name       = "api.dhrumilmehta.tech"
#   validation_method = "DNS"

#   tags = {
#     Environment = "staging"
#   }

#   lifecycle {
#     create_before_destroy = true
#   }
# }
# data "aws_route53_zone" "example" {
#   name         = "dhrumilmehta.tech"
#   private_zone = false
# }

# resource "aws_route53_record" "example" {
#   for_each = {
#     for dvo in aws_acm_certificate.example.domain_validation_options : dvo.domain_name => {
#       name   = dvo.resource_record_name
#       record = dvo.resource_record_value
#       type   = dvo.resource_record_type
#     }
#   }

#   allow_overwrite = true
#   name            = each.value.name
#   records         = [each.value.record]
#   ttl             = 60
#   type            = each.value.type
#   zone_id         = data.aws_route53_zone.example.zone_id
# }

# resource "aws_acm_certificate_validation" "example" {
#   certificate_arn         = aws_acm_certificate.example.arn

# }

data "aws_acm_certificate" "example" {
  domain   = "*.dhrumilmehta.tech"  # Replace with your domain or certificate's domain
}
