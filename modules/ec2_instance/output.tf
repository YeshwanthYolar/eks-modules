output "instance_id" {
  description = "The ID of the instance"
  value       = aws_instance.project_ec2.id
}

output "public_ip" {
  description = "The public IP address of the instance"
  value       = aws_instance.project_ec2.public_ip
}

output "private_ip" {
  description = "The private IP address of the instance"
  value       = aws_instance.project_ec2.private_ip
}
