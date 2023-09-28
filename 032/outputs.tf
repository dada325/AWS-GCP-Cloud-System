output "vpc_id" {
  value = module.vpc.vpc_id
}

output "public_subnet_id" {
  value = module.vpc.public_subnet_id
}

output "private_subnet_id" {
  value = module.vpc.private_subnet_id
}

output "bastion_host_public_ip" {
  value = module.public_resources.bastion_host_public_ip
}

output "external_load_balancer_dns_name" {
  value = module.openshift.external_load_balancer_dns_name
}
