terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">=3.71"
    }
  }
  required_version = ">=1.0"
}

provider "aws" {
  region = "eu-central-1"
}

resource "aws_instance" "app_server" {
  ami           = "ami-05ff5eaef6149df49"
  instance_type = "t2.micro"
  monitoring    = true
  tags = {
    Name = "ExampleAppServerInstance"
  }
}
