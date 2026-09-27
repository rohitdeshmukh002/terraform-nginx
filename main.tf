provider "aws" {
    region = "ap-south-1"
}

resource "aws_instance" "rohit" {
    ami             = "ami-090d68841c2a28756"
    instance_type   = "t3.micro"
    count           = 2

    key_name = "Ec2"

    subnet_id = "subnet-036e97c8eeb8ec01f"
    associate_public_ip_address = true
    vpc_security_group_ids = ["sg-020d7cd302b350734"]

    tags = {
    Name = "rohit"
    }

}

output "ec2_public_ips" {
  value = aws_instance.rohit[*].public_ip
}