variable "openshift_ami" {
  description = "AMI ID for OpenShift instances"
  type        = string
}

variable "control_plane_instance_type" {
  description = "Instance type for control plane nodes"
  default     = "m5.large"
}

variable "compute_node_instance_type" {
  description = "Instance type for compute nodes"
  default     = "m5.large"
}

variable "control_plane_count" {
  description = "Number of control plane nodes"
  default     = 3
}

variable "compute_node_count" {
  description = "Number of compute nodes"
  default     = 3
}

variable "private_subnet_id" {
  description = "ID of the private subnet"
  type        = string
}

variable "public_subnet_id" {
  description = "ID of the public subnet"
  type        = string
}

variable "vpc_id" {
  description = "ID of the VPC"
  type        = string
}
