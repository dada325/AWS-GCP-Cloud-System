module "s3_data" {
  source       = "./modules/s3"
  bucket_name  = var.data_bucket_name
  environment  = var.environment
}

module "iam_roles" {
  source              = "./modules/iam"
  glue_role_name      = var.glue_role_name
  sagemaker_role_name = var.sagemaker_role_name
}

module "glue_job" {
  source               = "./modules/glue"
  glue_job_name        = var.glue_job_name
  glue_role_arn        = module.iam_roles.glue_role_arn
  glue_script_location = var.glue_script_location
  glue_temp_dir        = var.glue_temp_dir
  glue_max_retries     = var.glue_max_retries
}

module "sagemaker_instance" {
  source                  = "./modules/sagemaker"
  sagemaker_instance_name = var.sagemaker_instance_name
  sagemaker_role_arn      = module.iam_roles.sagemaker_role_arn
  sagemaker_instance_type = var.sagemaker_instance_type
  environment             = var.environment
}
