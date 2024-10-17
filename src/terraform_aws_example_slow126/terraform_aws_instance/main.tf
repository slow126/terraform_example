terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"
}

provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "app_server" {
  ami           = "ami-06b21ccaeff8cd686"
  instance_type = "t2.micro"

  tags = {
    Name = "ExampleTerraformServerInstance"
  }
}

/*
resource "aws_ec2_instance_state" "app_server" {
    instance_id = aws_instance.app_server.id
    state = "stopped"
}
*/
