resource "aws_sagemaker_notebook_instance" "ml_notebook" {
  name          = var.sagemaker_instance_name
  role_arn      = var.sagemaker_role_arn
  instance_type = var.sagemaker_instance_type

  tags = {
    Name        = var.sagemaker_instance_name
    Environment = var.environment
  }
}
