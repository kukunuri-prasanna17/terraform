#skeleton block
resource "aws_instance" "demo" {
  ami           = "ami-09c813fb71547fc4f"
  instance_type = "t3.micro"
  vpc_security_group_ids = [
    "sg-08da864ed7845ff7e"
  ]
  tags = {
    Name = "import-demo-change"
  }
}
