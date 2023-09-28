variable "ami_id" {
  description = "AMI ID for the bastion host"
  type        = string
}

variable "public_subnet_id" {
  description = "ID of the public subnet"
  type        = string
}
