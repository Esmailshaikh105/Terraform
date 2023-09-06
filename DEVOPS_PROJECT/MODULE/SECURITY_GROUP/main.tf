resource "aws_security_group" "M_sg" {
  name = var.M_sg_name

  dynamic "ingress" {
    for_each = var.M_sg_ports
    iterator = port
    content {
      from_port   = port.value
      to_port     = port.value
      protocol    = var.M_proto
      cidr_blocks = var.M_cidrs
    }
  }

  dynamic "egress" {
    for_each = var.M_sg_ports
    iterator = port
    content {
      from_port   = port.value
      to_port     = port.value
      protocol    = var.M_proto
      cidr_blocks = var.M_cidrs
    }
  }
}