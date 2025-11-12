#for-loop with map
variable "instances" {
   default = {
    mongodb = "t3.micro"
    redis = "t3.micro"
    mysql = "t3.small"
   }
}

variable "domain_name" {
  default = "daws86s.cfd"
}
## Nested Map ##
#variable "aws_instance" {
  # default = {
  #   mongodb = {
  #    instance_type = "t3.medium"      ## each.value.instance_type
  #    ami_id  = "ami-09c813fb71547fc4f"   ## each.value.ami_id
  #   }
  #  }
  # }


# variable "aws_instance" {
#   default = {
#     mongodb = {
#       instance_type = "t3.medium"
#       ami  = "ami-09c813fb71547fc4f"
#     }
#   }
# }

# resource "aws_instance" "example" {
#   for_each = var.instances

#   ami           = lookup(var.aws_instance[each.key], "ami", "ami-0c02fb55956c7d316")  # default ami
#   instance_type = lookup(var.aws_instance[each.key], "instance_type", each.value)
#   tags = {
#     Name = each.key
#   }
# }
