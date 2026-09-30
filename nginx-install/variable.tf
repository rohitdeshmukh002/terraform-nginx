variable "aws_instance_type" {
  default = "t3.micro"
  type    = string
}

variable "aws_ami_type" {
  default = "ami-01a00762f46d584a1"
  type    = string
}

variable "env" {
  default = "prod"
  type = string
}

variable "ec2_default_valume" {
  default = 8
  type = number
}