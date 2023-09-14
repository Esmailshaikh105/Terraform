variable "M_db_name" {
  type = string
}

variable "M_username" {
  type = string
}

variable "M_password" {
  type = string
}

variable "M_db_subnet_group_name" {
  type = string
}

variable "M_vpc_security_group_ids" {
  type = list(any)
}