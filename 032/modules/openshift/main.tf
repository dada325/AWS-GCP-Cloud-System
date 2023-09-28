resource "aws_instance" "control_plane" {
  count = var.control_plane_count

  ami           = var.openshift_ami
  instance_type = var.control_plane_instance_type
  subnet_id     = var.private_subnet_id

  tags = {
    Name = "openshift-control-plane-${count.index}"
  }
}

resource "aws_instance" "compute_node" {
  count = var.compute_node_count

  ami           = var.openshift_ami
  instance_type = var.compute_node_instance_type
  subnet_id     = var.private_subnet_id

  tags = {
    Name = "openshift-compute-node-${count.index}"
  }
}

resource "aws_lb" "internal_lb" {
  name               = "openshift-internal-lb"
  internal           = true
  load_balancer_type = "network"
  enable_deletion_protection = false
  subnets            = [var.private_subnet_id]
}

resource "aws_lb_target_group" "api_internal" {
  name     = "api-internal"
  port     = 6443
  protocol = "TCP"
  vpc_id   = var.vpc_id
}

resource "aws_lb_listener" "listener_api_internal" {
  load_balancer_arn = aws_lb.internal_lb.arn
  port              = "6443"
  protocol          = "TCP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.api_internal.arn
  }
}

resource "aws_lb" "external_lb" {
  name               = "openshift-external-lb"
  internal           = false
  load_balancer_type = "network"
  enable_deletion_protection = false
  subnets            = [var.public_subnet_id]
}

resource "aws_lb_target_group" "api_external" {
  name     = "api-external"
  port     = 6443
  protocol = "TCP"
  vpc_id   = var.vpc_id
}

resource "aws_lb_listener" "listener_api_external" {
  load_balancer_arn = aws_lb.external_lb.arn
  port              = "6443"
  protocol          = "TCP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.api_external.arn
  }
}
