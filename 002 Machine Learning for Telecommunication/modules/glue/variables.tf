variable "glue_job_name" {
  description = "The name of the AWS Glue job"
  type        = string
}

variable "glue_role_arn" {
  description = "The ARN of the IAM role for AWS Glue to assume"
  type        = string
}

variable "glue_script_location" {
  description = "The S3 location of the ETL script for the Glue job"
  type        = string
}

variable "glue_temp_dir" {
  description = "The S3 location for Glue to store temporary files"
  type        = string
}

variable "glue_max_retries" {
  description = "The maximum number of times to retry this job if it fails"
  type        = number
  default     = 0
}
