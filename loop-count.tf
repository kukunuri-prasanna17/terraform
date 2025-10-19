resource "aws_instance" "terraform" {
     count = 3
     ami  = var.ami_id
     instance_type = var.instance_type  == "dev" ? "t3.micro" : "t3.medium" # condition: experssion ? "true_value" : "false_value" , Here gave a condition; if instance type could change depends on environment; "dev" ? t3.micro not t3.medium 
     vpc_security_group_ids = [aws_security_group.allow_all.id]
    tags = {
    Name = var.instances[count.index]
    terraform = "true"
   }
}


resource "aws_security_group" "allow_all" {
  name   = var.sg_name

egress {
    from_port        = var.egress_from_port # all ports
    to_port          = var.egress_to_port
    protocol         = var.protocol # -1 means all protocols
    cidr_blocks      = var.cidr_blocks #internet
  }

ingress {
    from_port        = var.ingress_from_port # all ports
    to_port          = var.ingress_to_port
    protocol         = var.protocol # -1 means all protocols
    cidr_blocks      = var.cidr_blocks #internet
  }

    tags = {
      Name = "allow-all"
    }

}
