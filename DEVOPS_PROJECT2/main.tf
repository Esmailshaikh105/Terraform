module "vpc" {
  source              = "./MODULE/VPC"
  M_vpc_cidr          = var.L_vpc_cidr
  M_availability_zone = var.L_availability_zone
  M_pvt_cidr          = var.L_pvt_cidr
  M_pub_cidr          = var.L_pub_cidr
  M_destination_cidr  = var.L_destination_cidr

}



// this is for web 
module "web_ssh_key_pair" {
  source            = "./MODULE/SSH_KEY"
  M_keyname         = var.L_web_keyname
  M_public_key_path = var.L_web_public_key_path
}

module "web_security_group" {
  source     = "./MODULE/SECURITY_GROUP"
  M_sg_name  = var.L_web_sg_name
  M_sg_ports = var.L_web_sg_ports
  M_proto    = var.L_web_proto
  M_cidrs    = var.L_web_cidrs
  M_vpc_id = module.vpc.my_vpc_id
}


module "web_ec2_instance" {
  source               = "./MODULE/EC2"
  M_ami_id             = var.L_web_ami_id
  M_instance_type      = var.L_web_instance_type
  M_tags               = var.L_web_tags
  M_key_name           = module.web_ssh_key_pair.ssh_key_pair_key_name
  M_security_group_ids = [module.web_security_group.security_group_id]
  M_subnet_id          = module.vpc.public_subnet_id
}


// this is for App
module "app_ssh_key_pair" {
  source            = "./MODULE/SSH_KEY"
  M_keyname         = var.L_app_keyname
  M_public_key_path = var.L_app_public_key_path
}

module "app_security_group" {
  source     = "./MODULE/SECURITY_GROUP"
  M_sg_name  = var.L_app_sg_name
  M_sg_ports = var.L_app_sg_ports
  M_proto    = var.L_app_proto
  M_cidrs    = var.L_app_cidrs
  M_vpc_id = module.vpc.my_vpc_id

}

module "app_ec2_instance" {
  source               = "./MODULE/EC2"
  M_ami_id             = var.L_app_ami_id
  M_instance_type      = var.L_app_instance_type
  M_tags               = var.L_app_tags
  M_key_name           = module.app_ssh_key_pair.ssh_key_pair_key_name
  M_security_group_ids = [module.app_security_group.security_group_id]
  M_subnet_id          = module.vpc.private_subnet_id
}


// this is for DB
module "db_ssh_key_pair" {
  source            = "./MODULE/SSH_KEY"
  M_keyname         = var.L_db_keyname
  M_public_key_path = var.L_db_public_key_path
}

module "db_security_group" {
  source     = "./MODULE/SECURITY_GROUP"
  M_sg_name  = var.L_db_sg_name
  M_sg_ports = var.L_db_sg_ports
  M_proto    = var.L_db_proto
  M_cidrs    = var.L_db_cidrs
  M_vpc_id = module.vpc.my_vpc_id
}

module "db_ec2_instance" {
  source               = "./MODULE/EC2"
  M_ami_id             = var.L_db_ami_id
  M_instance_type      = var.L_db_instance_type
  M_tags               = var.L_db_tags
  M_key_name           = module.db_ssh_key_pair.ssh_key_pair_key_name
  M_security_group_ids = [module.db_security_group.security_group_id]
  M_subnet_id          = module.vpc.private_subnet_id2

}


