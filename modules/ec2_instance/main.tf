resource "aws_instance" "project_ec2" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  subnet_id              = element(var.public_subnet_ids, 0)
  vpc_security_group_ids = [var.security_group_id]
  key_name               = var.key_name
  associate_public_ip_address = var.associate_public_ip
  user_data = file("app.sh") 
  tags = {
    Name = var.instance_name
  }
}
