provider "aws" {
  profile    = "default"
  region = var.Region
}

data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-trusty-14.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

resource "aws_instance" "main" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t2.nano"

  tags = {
    Name = var.Name
  }
}

module "ec2-local-module" {
  source  = "./ec2-local-module1"
}

# module "dummy" {
#   source = "github.com/rmadamanchi/tf-module-dummy"
# }
