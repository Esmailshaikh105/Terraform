terraform {

  required_providers {

    aws = {

      source = "hashicorp/aws"

      version = "5.13.1"

    }

  }

}

provider "aws" {

  # Configuration options

}
resource "aws_instance" "my_first_ec2" {

  ami           = "ami-08a52ddb321b32a8c"
  instance_type = "t2.micro"

  }
