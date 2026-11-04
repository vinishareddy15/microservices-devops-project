resource "aws_ecr_repository" "user_service" {
  name = "user-service"
}

resource "aws_ecr_repository" "product_service" {
  name = "product-service"
}

resource "aws_ecr_repository" "order_service" {
  name = "order-service"
}
