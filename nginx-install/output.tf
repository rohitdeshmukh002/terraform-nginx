# output "aws_instance_public_ip" {
#   value = aws_instance.my-ec2[*].public_ip
# }

# output "aws_instance_public_dns" {
#   value = aws_instance.my-ec2[*].public_dns
# }

# output "aws_instance_private_ip" {
#   value = aws_instance.my-ec2[*].private_ip
# }


// Source - https://stackoverflow.com/a/64992041
// Posted by Martin Atkins, modified by community. See post 'Timeline' for change history
// Retrieved 2026-09-29, License - CC BY-SA 4.0

output "aws_instance_public_ip" {
  value = {
    for name, instance in aws_instance.my-ec2 : name => instance.public_ip
  }
}
