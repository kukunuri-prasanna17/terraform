locals {
  instance_type = "t3.micro"
  common_name = "${var.project}.${var.environment}"
}