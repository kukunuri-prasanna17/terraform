resource "aws_security_group" "allow_all" {
  name   = "strict_rules"

 egress {
    from_port        = 0 # all ports
    to_port          = 0
    protocol         = "-1" # -1 means all protocols
    cidr_blocks      = ["0.0.0.0/0"] #internet
  }

#block
 dynamic "ingress" {
    for_each = toset(var.security_group)
  content {
    from_port        = ingress.value # ingress is special var from dynamic
    to_port          = ingress.value
    protocol         = "tcp" 
    cidr_blocks      = ["0.0.0.0/0"] #internet
  }
 }

    tags = {
      Name = "strict_sg"
    }
}