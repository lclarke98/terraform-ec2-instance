terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.27"
    }
  }

  required_version = ">= 0.14.9"
}

provider "aws" {
  profile = "default"
  region  = "eu-west-2"
}

resource "aws_instance" "web_server" {
  ami           = "ami-0015a39e4b7c0966f"
  instance_type = "t2.micro"
  key_name   = "ssh-key-01"

  tags = {
    Name = "web-server-instance"
  }
}

resource "aws_ebs_volume" "web_server-storage" {
  availability_zone = "eu-west-2"
  size              = 40
  type              = "gp3"
  tags = {
    Name = "web-server-storage"
  }
}