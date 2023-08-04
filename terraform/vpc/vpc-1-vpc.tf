resource "aws_vpc" "demo" {
  cidr_block = "10.1.0.0/16"

  tags = {
    Name        = "demo-vpc"
    Environment = "demo"
    Company     = "RAOGARU-Inc"
    Email       = "raogaruinc@gmail.com"
    Owner       = "Rao"
  }
}
