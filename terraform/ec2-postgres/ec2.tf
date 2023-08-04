resource "aws_instance" "web" {
  ami                         = "ami-0b5eea76982371e91"
  instance_type               = "t2.micro"
  key_name                    = "rao-aws-key"
  user_data                   = templatefile("install_postgres.sh", { pg_hba_file = templatefile("pg_hba.conf", { allowed_ip = "0.0.0.0/0" }), })
  subnet_id                   = "subnet-0ba3dc9fa4bcdb6f3"
  associate_public_ip_address = true
  vpc_security_group_ids      = ["sg-025dd67aa62ad778d"]
  tags = {
    Name = "postgresql"
  }
}

# Show the public IP of the newly created instance
output "instance_ip_addr" {
  value = aws_instance.web.*.public_ip
}
