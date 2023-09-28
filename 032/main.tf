module "vpc" {
  source = "./modules/vpc"
  cidr_block = var.vpc_cidr_block
  public_subnet_cidr = var.public_subnet_cidr
  private_subnet_cidr = var.private_subnet_cidr
}

module "public_resources" {
  source = "./modules/public-resources"
  ami_id = var.bastion_ami
  public_subnet_id = module.vpc.public_subnet_id
}

module "openshift" {
  source = "./modules/openshift"
  openshift_ami = var.openshift_ami
  private_subnet_id = module.vpc.private_subnet_id
  public_subnet_id = module.vpc.public_subnet_id
  vpc_id = module.vpc.vpc_id
  control_plane_instance_type = var.control_plane_instance_type
  compute_node_instance_type = var.compute_node_instance_type
  control_plane_count = var.control_plane_count
  compute_node_count = var.compute_node_count
}

module "other_services" {
  source = "./modules/others"
  domain_name = var.domain_name
}
