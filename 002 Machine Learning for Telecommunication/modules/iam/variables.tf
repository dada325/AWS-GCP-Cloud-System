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
