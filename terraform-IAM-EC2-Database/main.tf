resource "aws_instance" "public" {
  ami=var.ami
  instance_type = var.instance_type
  subnet_id = var.subnet_id
  associate_public_ip_address = "true"
  key_name = "yeosy-1403"
  vpc_security_group_ids = [aws_security_group.allow_ssh.id]
  tags ={
    "Name":"yeosy-1403"
  }
}

resource "aws_security_group" "allow_ssh" {
  name = "yeosy"
  description = "This group allow ssh in ssg "
  vpc_id = "vpc-0a498991ea4dd5943"

}

resource "aws_vpc_security_group_ingress_rule" "allow_tls_ipv4" {
 security_group_id = aws_security_group.allow_ssh.id
  cidr_ipv4         = "0.0.0.0/0"  
  from_port         = 22
  ip_protocol       = "tcp"
  to_port           = 22  
}

locals {
  name_prefix = "yeosy"
}

# resource "aws_iam_role" "roles example" {
#   name = "${local.name_prefix}-role example"

#}

