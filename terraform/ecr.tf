resource "aws_ecr_repository" "ecr-front" {
  name                 = "awesome-front"
  image_tag_mutability = "IMMUTABLE"

  image_scanning_configuration {
    scan_on_push = false
  }
  tags = {
    Name = "awesome-front"
  }
}

resource "aws_ecr_repository" "ecr-back" {
  name                 = "awesome-back"
  image_tag_mutability = "IMMUTABLE"

  image_scanning_configuration {
    scan_on_push = false
  }
  tags = {
    Name = "awesome-back"
  }
}