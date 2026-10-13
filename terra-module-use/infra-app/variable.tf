variable "env" {
  description = "my envirnment name"
  type = string
}

variable "bucket_name" {
  description = "my project name"
  type = string
}

variable "ec2_count" {
    description = "ec2 server count on envs"
    type = number
}

variable "instance_type" {
  description = "this is the instance type for the given server"
  type = string
}

variable "ami_id" {
  description = "this is the ami id required for diffrenet environment"
  type = string
}

variable "hash_key" {
  description = "this is hash key"
  type = string
}
