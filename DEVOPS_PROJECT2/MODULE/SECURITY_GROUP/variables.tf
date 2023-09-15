variable "M_sg_name" {
  type = string
}

variable "M_sg_ports" {
  type = list(any)
}

variable "M_proto" {
  type = string
}

variable "M_cidrs" {
  type = list(any)
}

variable "M_vpc_id" {
  type = string
}

