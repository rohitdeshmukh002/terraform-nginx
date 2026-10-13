resource "aws_key_pair" "login_key" {
  key_name = "${var.env}-terra-key-module"
  public_key = file("terra-key-module.pub")

  tags = {
    Environment = var.env 
  }
}

resource "aws_default_vpc" "default" {
  
}

resource "aws_security_group" "env_sg" {
  name = "${var.env}-security-group"
  description = "this is the security group for the my infra"
  vpc_id = aws_default_vpc.default.id

  ingress {
    from_port = 22
    to_port = 22
    cidr_blocks = [ "0.0.0.0/0" ]
    protocol = "tcp"
  } 

  ingress {
    from_port = 80
    to_port = 80
    cidr_blocks = ["0.0.0.0/0"]
    protocol = "tcp"
  }

  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.env}-security-group"
  }
}

resource "aws_instance" "server-ec2" {
  count = var.ec2_count
  key_name = aws_key_pair.login_key.key_name
  security_groups = [ aws_security_group.env_sg.name ]
  instance_type = var.instance_type
  ami = var.ami_id

  tags = {
    Name = "${var.env}-server-${var.ec2_count}"
    env = "${var.env}"
  }
}




