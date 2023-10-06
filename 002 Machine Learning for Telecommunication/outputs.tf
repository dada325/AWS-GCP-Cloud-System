output "s3_bucket_arn" {
  value = module.s3_data.s3_bucket_arn
}

output "glue_role_arn" {
  value = module.iam_roles.glue_role_arn
}

output "sagemaker_role_arn" {
  value = module.iam_roles.sagemaker_role_arn
}

output "glue_job_name" {
  value = module.glue_job.glue_job_name
}

output "sagemaker_notebook_url" {
  value = module.sagemaker_instance.sagemaker_notebook_url
}
