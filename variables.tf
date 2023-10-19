variable "clouidfront_alias" {
  description = "Name of the alias"
  type        = string
}

variable "s3_bucket_name" {
  description = "Name of the s3Bucket"
  type        = string
}

# variable "s3_bucket_name" {
#   description = "Name of the s3Bucket"
#   type        = string
# }

variable "DNS_record_name" {
  description = "Name of the DNS record"
  type        = string
}
