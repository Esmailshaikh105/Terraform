#Load Balancer for WEB

resource "aws_lb" "M_cloudethix-lb" {
  name               = var.M_lb_name
  load_balancer_type = var.M_lb_type
  security_groups    = var.M_sg_ids
  subnets            = var.M_subnet_ids

}
