resource "aws_instance" "import-instance" {
  ami             = "ami-08e3b3155fc937a94"
  instance_type   = "t2.micro"
  vpc_security_group_ids =  [ "sg-0eeac1fc11d72dada" ]

  tags = {
    Name = "state-infra"
  }
}