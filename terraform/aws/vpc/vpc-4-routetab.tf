resource "aws_route_table" "demo_public_rt" {
  vpc_id = aws_vpc.demo.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "demo-public-route-table"
  }
}

# ======================================================================
#Associating Public Subnets to the Second Route Table

resource "aws_route_table_association" "public_subnet_asso" {
  count          = length(var.demo_public_subnet_cidrs)
  subnet_id      = element(aws_subnet.demo_public_subnets[*].id, count.index)
  route_table_id = aws_route_table.demo_public_rt.id
}
