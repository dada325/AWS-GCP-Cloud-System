variable "sagemaker_instance_name" {
  description = "The name of the Amazon SageMaker notebook instance"
  type        = string
}

variable "sagemaker_role_arn" {
  description = "The ARN of the IAM role for Amazon SageMaker to assume"
  type        = string
}

variable "sagemaker_instance_type" {
  description = "The type of machine for the SageMaker notebook instance (e.g., ml.t2.medium)"
  type        = string
  default     = "ml.t2.medium"
}

variable "environment" {
  description = "The environment (e.g. prod, dev)"
  type        = string
}
