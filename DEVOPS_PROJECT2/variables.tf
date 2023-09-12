// this is for vpc

variable "L_vpc_cidr" {
  type = string
}

variable "L_availability_zone" {
  type = list(any)
}

variable "L_pvt_cidr" {
  type = list(any)
}

variable "L_pub_cidr" {
  type = list(any)
}

variable "L_destination_cidr" {
  type = string
}



// this is for web 
variable "L_web_keyname" {
  type = string
}

variable "L_web_public_key_path" {
  type = string
}

variable "L_web_ami_id" {
  type = string
}

variable "L_web_instance_type" {
  type = string
}

variable "L_web_tags" {
  type = map(any)
}

variable "L_web_sg_name" {
  type = string
}

variable "L_web_sg_ports" {
  type = list(any)
}

variable "L_web_proto" {
  type = string
}

variable "L_web_cidrs" {
  type = list(any)
}


// this is for app
variable "L_app_keyname" {
  type = string
}

variable "L_app_public_key_path" {
  type = string
}

variable "L_app_ami_id" {
  type = string
}

variable "L_app_instance_type" {
  type = string
}
variable "L_app_tags" {
  type = map(any)
}

variable "L_app_sg_name" {
  type = string
}

variable "L_app_sg_ports" {
  type = list(any)
}

variable "L_app_proto" {
  type = string
}

variable "L_app_cidrs" {
  type = list(any)
}

// this is for DB 
variable "L_db_keyname" {
  type = string
}

variable "L_db_public_key_path" {
  type = string
}

variable "L_db_ami_id" {
  type = string
}

variable "L_db_instance_type" {
  type = string
}

variable "L_db_tags" {
  type = map(any)
}

variable "L_db_sg_name" {
  type = string
}

variable "L_db_sg_ports" {
  type = list(any)
}

variable "L_db_proto" {
  type = string
}

variable "L_db_cidrs" {
  type = list(any)
}

