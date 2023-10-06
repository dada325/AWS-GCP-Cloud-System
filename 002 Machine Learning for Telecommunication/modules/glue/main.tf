resource "aws_glue_job" "data_conversion" {
  name     = var.glue_job_name
  role_arn = var.glue_role_arn
  
  command {
    name            = "glueetl"
    script_location = var.glue_script_location
  }
  
  default_arguments = {
    "--TempDir" = var.glue_temp_dir
  }
  
  max_retries = var.glue_max_retries
}

