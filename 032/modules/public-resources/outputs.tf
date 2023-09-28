output "bastion_host_public_ip" {
  description = "Public IP address of the bastion host."
  value       = aws_instance.bastion.public_ip
}

output "nat_gateway_id" {
  description = "The ID of the NAT gateway."
  value       = aws_nat_gateway.nat_gateway.id
}
