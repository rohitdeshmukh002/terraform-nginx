module "dev-infra" {
  source        = "./infra-app"
  env           = "dev"
  bucket_name   = "infra-app-bucket-module"
  instance_type = "t3.micro"
  ec2_count     = 1
  ami_id        = "ami-01a00762f46d584a1"
  hash_key      = "studentID"
}

module "prod-infra" {
  source        = "./infra-app"
  env           = "Prod"
  bucket_name   = "infra-app-bucket-module"
  instance_type = "t2.small"
  ec2_count     = 2
  ami_id        = "ami-01a00762f46d584a1"
  hash_key      = "studentID"
}