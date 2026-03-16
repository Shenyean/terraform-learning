variable "ami" {
    description = "this is the AMI type default is ap-southeast-1 linux-ami"
    default = "ami-0be9cb9f67c8dabd6"
}
variable "instance_type" {
  description = "this is the instance type"
  default = "t3.micro"
}
variable "subnet_id" {
  description = "this is the subnet id (ultimate aim is to pull it from the system)"
  default = "subnet-048a1bb9312e319aa"
}
# variable "" {
  
# }