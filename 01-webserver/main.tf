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
  region = "eu-west-1"
}

resource "aws_instance" "app" {
  instance_type     = "t2.micro"
  ami               = "ami-00463ddd1036a8eb6"
  key_name  = "cert"
  user_data = <<-EOF
              #!/bin/bash
              sudo service apache2 start
              EOF
  tags = {
    Name = "my_server"
  }
}
