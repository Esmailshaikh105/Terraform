variable "M_vpc_cidr" {
  type = string
}

variable "M_availability_zone" {
  type = list(any)
}

variable "M_pvt_cidr" {
  type = list(any)
}

variable "M_pub_cidr" {
  type = list(any)
}

variable "M_destination_cidr" {
  type = string
}