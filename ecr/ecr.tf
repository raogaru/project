resource "aws_ecr_repository" "ecr1" {
  name                 = "raogaru-ecr2"
  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = false
  }
}
