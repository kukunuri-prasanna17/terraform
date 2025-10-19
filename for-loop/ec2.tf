resource "aws_instance" "terraform" {
    for_each = var.instances
      ami = "ami-09c813fb71547fc4f" 
     instance_type = each.value
     vpc_security_group_ids = [aws_security_group.allow_all.id]
    tags = {
        Name = each.key
        terraform = "true"
    }
}

resource "aws_security_group" "allow_all" {
  name   = "allow-all"

 egress {
    from_port        = 0 # all ports
    to_port          = 0
    protocol         = "-1" # -1 means all protocols
    cidr_blocks      = ["0.0.0.0/0"] #internet
  }

 ingress {
    from_port        = 0 # all ports
    to_port          = 0
    protocol         = "-1" # -1 means all protocols
    cidr_blocks      = ["0.0.0.0/0"] #internet
  }

    tags = {
      Name = "allow-all"
    }
}