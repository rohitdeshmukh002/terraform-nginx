provider "aws" {
  region = "ap-south-1"
}

resource "aws_instance" "Ec2" {

  ami           = "ami-08e3b3155fc937a94"
  instance_type = "t3.micro"
  count         = 1

  security_groups = ["sg-0eeac1fc11d72dada"]
  subnet_id       = "subnet-0c593213aeeeaa217"

  key_name = "volume"

  root_block_device {
    volume_size = 10
    volume_type = "gp3"
  }

  tags = {
    Name = "volume"
  }
}