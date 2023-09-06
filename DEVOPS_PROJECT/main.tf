module "ssh_key_pair" {
  source          = "./MODULE/SSH_KEY"
  M_keyname         = var.L_keyname
  M_public_key_path = var.L_public_key_path

}

module "web_ec2_instance" {
  source                 = "./MODULE/EC2"
  M_ami_id                 = var.L_ami_id
  M_instance_type          = var.L_instance_type
  M_key_name                 =  module.ssh_key_pair.ssh_key_pair_key_name
}
