variable "aws_instance_type" {
    default = "t3.micro"
    type = string
}

variable "aws_root_storage_size" {
  default = 8
  type = number
}

variable "ec2_ami_id" {
  default = "ami-01a00762f46d584a1"
  type = string
}