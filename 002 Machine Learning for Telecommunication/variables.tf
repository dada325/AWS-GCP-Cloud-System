# General
variable "environment" {
  description = "The environment (e.g. prod, dev)"
  type        = string
}

# S3
variable "data_bucket_name" {
  description = "The name of the S3 bucket for data storage"
  type        = string
}

# IAM
variable "glue_role_name" {
  description = "The name for the AWS Glue IAM role"
  type        = string
  default     = "GlueServiceRole"
}

variable "sagemaker_role_name" {
  description = "The name for the Amazon SageMaker IAM role"
  type        = string
  default     = "SageMakerExecutionRole"
}

# Glue
variable "glue_job_name" {
  description = "The name of the AWS Glue job"
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

# SageMaker
variable "sagemaker_instance_name" {
  description = "The name of the Amazon SageMaker notebook instance"
  type        = string
}

variable "sagemaker_instance_type" {
  description = "The type of machine for the SageMaker notebook instance (e.g., ml.t2.medium)"
  type        = string
  default     = "ml.t2.medium"
}
