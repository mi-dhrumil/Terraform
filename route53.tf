data "aws_route53_zone" "example" {
  name         = "dhrumilmehta.tech"
  private_zone = false
}
# resource "aws_route53_record" "api" {
#   zone_id = data.aws_route53_zone.example.zone_id
#   name    = "api.dhrumilmehta.tech"
#   type    = "A"
#   ttl     = 300
#   records = [aws_eip.stage_ip.public_ip]
# }


resource "aws_route53_record" "api" {
  zone_id = data.aws_route53_zone.example.zone_id
  name    = var.DNS_record_name
  type    = "A"
#   ttl     = 300
alias {
 name = aws_cloudfront_distribution.s3_distribution.domain_name
 evaluate_target_health = false
 zone_id = aws_cloudfront_distribution.s3_distribution.hosted_zone_id

}
}