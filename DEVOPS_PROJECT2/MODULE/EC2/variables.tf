variable "M_ami_id" {
  type = string
}

variable "M_instance_type" {
  type = string
}

variable "M_key_name" {
  type = string
}

variable "M_tags" {
  type = map(any)
}

variable "M_security_group_ids" {
  type = list(any)
}

variable "M_subnet_id" {
  type = string
}

