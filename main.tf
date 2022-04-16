terraform {
  backend "s3" {}

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
  key_name   = var.ssh
  tags = {
    Name = "web-server-instance"
  }
}

resource "aws_ebs_volume" "web_server_storage" {
  availability_zone = "eu-west-2a"
  size              = 20
  type              = "gp3"
  tags = {
    Name = "web-server-storage"
  }
}

#resource "aws_db_instance" "web-server-data" {
#  instance_class = "db.t2.micro"
#  allocated_storage = 10
#  engine = "mysql"
#  engine_version = "5.7"
#  name = "web-server-db"
#  username = var.db.username
#
#}