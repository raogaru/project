resource "aws_security_group" "raogaru_eks_ng1_sg" {
  name_prefix = "raogaru_eks_ng1_sg"
  vpc_id      = module.vpc.vpc_id
  ingress {
    from_port = 22
    to_port   = 22
    protocol  = "tcp"
    cidr_blocks = [
      "10.1.0.0/16",
    ]
  }
}

resource "aws_security_group" "raogaru_eks_ng2_sg" {
  name_prefix = "raogaru_eks_ng2_sg"
  vpc_id      = module.vpc.vpc_id
  ingress {
    from_port = 22
    to_port   = 22
    protocol  = "tcp"
    cidr_blocks = [
      "192.168.0.0/16",
    ]
  }
}

