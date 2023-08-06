# Create EC2 in default VPC
resource "aws_instance" "ec2" {
  ami                         = "ami-0b5eea76982371e91"
  instance_type               = "t2.micro"
  key_name                    = "rao-aws-key"
  associate_public_ip_address = false
  vpc_security_group_ids      = [aws_default_security_group.default.id]
}

# Show the public IP of the newly created instance
output "instance_ip_addr" {
  value = aws_instance.ec2.*.public_ip
}
