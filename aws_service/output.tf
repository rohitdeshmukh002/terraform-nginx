output "aws_instance_public_ip" {
  value = aws_instance.automate-ec2.public_ip
}

output "aws_instance_pubic_dns" {
  value = aws_instance.automate-ec2.public_dns
}

output "aws_instance_private_ip" {
  value = aws_instance.automate-ec2.private_ip
}
