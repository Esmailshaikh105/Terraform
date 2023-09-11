// this is for web 
L_web_keyname         = "web-ssh-key"
L_web_public_key_path = "/root/.ssh/id_rsa.pub"
L_web_ami_id          = "ami-08a52ddb321b32a8c"
L_web_instance_type   = "t2.micro"
L_web_tags            = { Name = "web-instance" }
L_web_sg_name         = "web-sg"
L_web_sg_ports        = [22, 80, 443]
L_web_proto           = "tcp"
L_web_cidrs           = ["0.0.0.0/0"]



// this is for app

L_app_keyname         = "app-ssh-key"
L_app_public_key_path = "/root/.ssh/id_rsa.pub"
L_app_ami_id          = "ami-08a52ddb321b32a8c"
L_app_instance_type   = "t2.micro"
L_app_tags            = { Name = "app-instance" }
L_app_sg_name         = "app-sg"
L_app_sg_ports        = [22, 8080]
L_app_proto           = "tcp"
L_app_cidrs           = ["0.0.0.0/0"]




// this is for db
L_db_keyname         = "db-ssh-key"
L_db_public_key_path = "/root/.ssh/id_rsa.pub"
L_db_ami_id          = "ami-08a52ddb321b32a8c"
L_db_instance_type   = "t2.micro"
L_db_tags            = { Name = "db-instance" }
L_db_sg_name         = "db-sg"
L_db_sg_ports        = [22, 3306]
L_db_proto           = "tcp"
L_db_cidrs           = ["0.0.0.0/0"]



// this is for vpc
L_vpc_cidr = "10.0.0.0/16"
L_availability_zone = ["us-east-1a","us-east-1b"]
L_pvt_cidr = ["10.0.2.0/24","10.0.3.0/24"]
L_pub_cidr = ["10.0.0.0/24","10.0.1.0/24"]
L_destination_cidr = "0.0.0.0/0"