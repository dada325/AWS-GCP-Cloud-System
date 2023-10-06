resource "aws_iam_role" "glue_role" {
  name = "GlueServiceRole"
  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Action = "sts:AssumeRole",
        Effect = "Allow",
        Principal = {
          Service = "glue.amazonaws.com"
        }
      }
    ]
  })
}

resource "aws_iam_policy_attachment" "glue_s3_access" {
  name       = "GlueS3Access"
  roles      = [aws_iam_role.glue_role.name]
  policy_arn = "arn:aws:iam::aws:policy/AmazonS3FullAccess" # NOTE: This provides full access. Restrict further as necessary.
}

resource "aws_iam_role" "sagemaker_role" {
  name = "SageMakerExecutionRole"
  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Action = "sts:AssumeRole",
        Effect = "Allow",
        Principal = {
          Service = "sagemaker.amazonaws.com"
        }
      }
    ]
  })
}

resource "aws_iam_policy_attachment" "sagemaker_s3_access" {
  name       = "SageMakerS3Access"
  roles      = [aws_iam_role.sagemaker_role.name]
  policy_arn = "arn:aws:iam::aws:policy/AmazonS3FullAccess" # NOTE: This provides full access. Restrict further as necessary.
}
