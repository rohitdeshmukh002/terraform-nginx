resource "aws_key_pair" "my-key" {
  key_name   = "terra-ec2-key"
  public_key = file("terra-ec2-key.pub")
}

resource "aws_default_vpc" "default" {
  tags = {
    Name = "Default VPC"
  }
}

resource "aws_security_group" "default" {
  name   = "automate-sg"
  vpc_id = aws_default_vpc.default.id

  tags = {
    Name = "automate-sg"
  }

  #inbound rule(icoming)
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  #oubound rules

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1" #equivalenet to all
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "automate-ec2" {
  key_name        = aws_key_pair.my-key.key_name
  security_groups = [aws_security_group.default.name]

  instance_type = "t3.micro"
  ami           = "ami-01a00762f46d584a1"

  root_block_device {
    volume_size = 8
    volume_type = "gp3"
  }

  tags = {
    Name = "automate-ec2"
  }
}