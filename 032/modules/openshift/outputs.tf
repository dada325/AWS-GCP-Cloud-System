output "control_plane_instance_ids" {
  description = "IDs of the control plane instances."
  value       = aws_instance.control_plane.*.id
}

output "compute_node_instance_ids" {
  description = "IDs of the compute node instances."
  value       = aws_instance.compute_node.*.id
}

output "internal_load_balancer_dns_name" {
  description = "DNS name of the internal load balancer."
  value       = aws_lb.internal_lb.dns_name
}

output "external_load_balancer_dns_name" {
  description = "DNS name of the external load balancer."
  value       = aws_lb.external_lb.dns_name
}
