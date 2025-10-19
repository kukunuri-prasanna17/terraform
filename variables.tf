variable "ami_id" {
    type = string
   default = "ami-09c813fb71547fc4f"
}

variable "instance_type" {
    type = string
  default = "dev"
}

variable "ec2_tags" {
   type = map
   default = {
    Name ="terraform"
    Project = "devops"
   }
}

variable "sg_name" {
  default = "allow-all"
}

variable "cidr_blocks" {
    type = list
  default = ["0.0.0.0/0"]
}

variable "ingress_from_port" {
    default = 0
}

variable "ingress_to_port" {
    default = 0
}

variable "egress_from_port" {
    default = 0
}

variable "egress_to_port" {
    default = 0
}

variable "protocol" {
  type = string
  default = "-1"
}