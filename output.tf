# output "public_ip" {
#   value       = aws_instance.my_ec2.public_ip
#   description = "The public IP address of the web server"
# }

# output "elastic_ip" {
#   value = aws_eip.stage_ip.public_ip
#   description = "The public IP address of the web server"
  
# }

output "elastic_ip" {
  value = aws_cloudfront_distribution.s3_distribution.domain_name
  description = "The public IP address of the web server"
  
}