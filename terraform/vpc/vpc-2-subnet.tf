variable "demo_public_subnet_cidrs" {
  type        = list(string)
  description = "demo-vpc-public-subnet-cidr-values"
  default     = ["10.1.1.0/24", "10.1.2.0/24"]
}

variable "demo_private_subnet_cidrs" {
  type        = list(string)
  description = "demo-vpc-private-subnet-cidr-values"
  default     = ["10.1.4.0/24", "10.1.5.0/24"]
}

variable "demo_public_azs" {
  type        = list(string)
  description = "public-availability-zones"
  default     = ["us-east-1a", "us-east-1b"]
}

variable "demo_private_azs" {
  type        = list(string)
  description = "public-availability-zones"
  default     = ["us-east-1d", "us-east-1e"]
}

resource "aws_subnet" "demo_public_subnets" {
  count             = length(var.demo_public_subnet_cidrs)
  vpc_id            = aws_vpc.demo.id
  cidr_block        = element(var.demo_public_subnet_cidrs, count.index)
  availability_zone = element(var.demo_public_azs, count.index)

  tags = {
    Name        = "demo-public-subnet-${count.index + 1}"
    Environment = "demo"
  }
}

resource "aws_subnet" "demo_private_subnets" {
  count             = length(var.demo_private_subnet_cidrs)
  vpc_id            = aws_vpc.demo.id
  cidr_block        = element(var.demo_private_subnet_cidrs, count.index)
  availability_zone = element(var.demo_private_azs, count.index)

  tags = {
    Name        = "demo-private-subnet-${count.index + 1}"
    Environment = "demo"
  }
}
