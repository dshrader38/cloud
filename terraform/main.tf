
terraform {
  required_version = ">= 0.12"
}

provider "aws" {
  version = "~> 2.0"
  region  = "us-west-2"
}

#owner = 641939414755
#instance-type = t3a.micro
#availability zone = us-west-2a
#platform = Red Hat Enterprise Linux
#Root device type = ebs
#EBS-optimized = true

# Create a VPC
#resource "aws_vpc" "example" {
#  cidr_block = "10.0.0.0/16"
#}

resource "aws_instance" "example" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t2.micro"
  tags = {
    Name = var.instance_name
  }
}

data "aws_ami" "ubuntu" {
  most_recent = true
  owners      = ["099720109477"] # Canonical

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  filter {
    name   = "architecture"
    values = ["x86_64"]
  }

  filter {
    name   = "image-type"
    values = ["machine"]
  }

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-xenial-16.04-amd64-server-*"]
  }
}