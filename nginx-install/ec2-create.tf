resource "aws_key_pair" "my_key" {
  key_name   = "terra-key"
  public_key = file("terra-key.pub")
}

resource "aws_default_vpc" "default" {
  tags = {
    Name = "default VPC"
  }
}

resource "aws_security_group" "default" {
  name   = "security-group"
  vpc_id = aws_default_vpc.default.id

  tags = {
    Name = "auto-sg"
  }

  #inbound rule
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

  #outbound rules
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}


resource "aws_instance" "my-ec2" {
  key_name        = aws_key_pair.my_key.key_name
  security_groups = [aws_security_group.default.name]

  instance_type = var.aws_instance_type
  ami           = var.aws_ami_type

  user_data = file("nginx-install.sh")

  tags = {
    Name = "nginx-automate"
  }
}

