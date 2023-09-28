resource "aws_route53_zone" "main" {
  name = var.domain_name
}

resource "aws_s3_bucket" "openshift_data" {
  bucket = "openshift-data-bucket-${random_string.bucket_suffix.result}"
  acl    = "private"
}

resource "random_string" "bucket_suffix" {
  length  = 8
  special = false
}

resource "aws_secretsmanager_secret" "guardium_insights_secret" {
  name = "guardium_insights_secret"
}
