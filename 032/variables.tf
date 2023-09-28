variable "aws_region" {
  description = "The AWS region to deploy the infrastructure in."
  default     = "us-west-1"  # You can set this to your preferred region.
  type        = string
}

variable "openshift_ami" {
  description = "AMI ID for OpenShift nodes."
  type        = string
  default     = "ami-0c55b159cbfafe1f0"  # This is a placeholder. Replace with your actual AMI ID.
}

variable "bastion_ami" {
  description = "AMI ID for the bastion host."
  type        = string
  default     = "ami-0c55b159cbfafe1f0"  # This is a placeholder. Replace with your actual AMI ID.
}

variable "domain_name" {
  description = "The domain name for Route53."
  type        = string
  default     = "example.com"  # Placeholder. Replace with your actual domain.
}

variable "vpc_cidr_block" {
  description = "CIDR block for the VPC."
  default     = "10.0.0.0/16"
  type        = string
}

variable "public_subnet_cidr" {
  description = "CIDR block for the public subnet."
  default     = "10.0.1.0/24"
  type        = string
}

variable "private_subnet_cidr" {
  description = "CIDR block for the private subnet."
  default     = "10.0.2.0/24"
  type        = string
}

variable "control_plane_instance_type" {
  description = "Instance type for control plane nodes."
  default     = "m5.large"
  type        = string
}

variable "compute_node_instance_type" {
  description = "Instance type for compute nodes."
  default     = "m5.large"
  type        = string
}

variable "control_plane_count" {
  description = "Number of control plane nodes."
  default     = 3
  type        = number
}

variable "compute_node_count" {
  description = "Number of compute nodes."
  default     = 3
  type        = number
}
