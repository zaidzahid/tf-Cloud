terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "6.12.0"
    }
  }
}

provider "aws" {
  region = "eu-north-1"
}

resource "aws_instance" "mywebserver" {
  ami                         = "ami-0a716d3f3b16d290c"  # Ubuntu AMI for eu-north-1 (check latest)
  instance_type               = "t3.micro"

  user_data = <<-EOF
              #!/bin/bash 
              apt update -y
              apt install -y nginx
              systemctl start nginx
              systemctl enable nginx
              EOF

  tags = {
    Name = "mywebserver"
  }
}
