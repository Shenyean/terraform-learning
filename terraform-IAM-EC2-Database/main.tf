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
  iam_instance_profile = aws_iam_instance_profile.profile_example.name
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

resource "aws_vpc_security_group_egress_rule" "allow_https_ipv4" {
    security_group_id = aws_security_group.allow_ssh.id
    cidr_ipv4 = "0.0.0.0/0"
    from_port = 443
    ip_protocol = "tcp"
    to_port = 443
}

locals {
  name_prefix = "yeosy"
}

# resource "aws_iam_role" "roles example" {
#   name = "${local.name_prefix}-role example"

#}

resource "aws_iam_role" "role_example" {
 name = "${local.name_prefix}-role-example"
 assume_role_policy = data.aws_iam_policy_document.role_example.json
}
resource "aws_iam_policy" "policy_example" {
  name = "${local.name_prefix}-policy-example"
  policy = data.aws_iam_policy_document.policy_example.json
}

resource "aws_iam_role_policy_attachment" "attach_example" {
 role       = aws_iam_role.role_example.name
 policy_arn = aws_iam_policy.policy_example.arn
}


resource "aws_iam_instance_profile" "profile_example" {
 name = "${local.name_prefix}-profile-example"
 role = aws_iam_role.role_example.name
}
