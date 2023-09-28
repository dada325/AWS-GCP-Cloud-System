output "route53_zone_id" {
  description = "The ID of the Route53 zone."
  value       = aws_route53_zone.main.zone_id
}

output "s3_bucket_arn" {
  description = "The ARN of the S3 bucket for OpenShift data."
  value       = aws_s3_bucket.openshift_data.arn
}

output "guardium_insights_secret_arn" {
  description = "The ARN of the Guardium Insights secret in Secrets Manager."
  value       = aws_secretsmanager_secret.guardium_insights_secret.arn
}
