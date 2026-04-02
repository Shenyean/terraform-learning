# variable "name_prefix" {
#   description = "Name prefix for application"
#   type        = string
# }

variable "instance_type" {
  description = "Instance type of EC2"
  type        = string
  default     = "t3.micro"
}

variable "instance_count" {
  description = "Number of instance spun up"
  type        = number
  default     = 0
}

##variable "vpc_id" {
##description = "Virtual private cloud id"
#type        = string

#}
variable "public_subnet" {
  description = "choice of deploying to public or prive subnet"
  type        = bool
  default     = true

}
variable "key_name" {
  description = "Ec2 KeyPair Name"
  type        = string
  default     = ""
}
variable "ami_id" {
  description = "AMI ID "
  type        = string
  default     = "ami-0be9cb9f67c8dabd6"

}
