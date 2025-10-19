resource "aws_instance" "terraform" {
      ami = "ami-09c813fb71547fc4f" 
     instance_type = "t3.micro"
     vpc_security_group_ids = [aws_security_group.allow_all.id]
    tags = {
        Name = "terraform"
        terraform = "true"
    }

 provisioner "local-exec"{
   command = "echo ${self.private_ip} >  inventory"
   on_failure = continue
 }
   provisioner "local-exec"{
   command = "echo Instance destroyed Sucessfully!"
   when = destroy
 }

 connection {
   type = "ssh"
   user = "ec2-user"
   password = "DevOps321"
   host = self.public_ip
 }

 provisioner "remote-exec" {
   #inline = [
    #"sudo dnf install nginx -y",
     #"sudo  systemctl start nginx"
 #]  
  inline = [ 
    "sudo systemctl stop nginx",
    "echo 'Sucuessfully Stopped Nginx Server' "
  ]
    when = destroy
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