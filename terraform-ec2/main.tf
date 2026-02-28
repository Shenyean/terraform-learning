resource "aws_instance" "public" {
    ami = "ami-0ac0e4288aa341886"
    instance_type = "t2.micro"
    subnet_id = "subnet-07613369be510e0d0"
    associate_public_ip_address = true
    key_name = "yeosy-tf-2801"
    vpc_security_group_ids = [aws_security_group.allow_ssh.id]
    tags = {
        Name = "yeosy-ec2"
    }
}

resource "aws_security_group" "allow_ssh" {
    name = "yeosy-sg-2802"
    description = "Allow SSH inbound"
    vpc_id = "vpc-024ab25ff63a3d405"
}

resource "aws_vpc_security_group_ingress_rule" "allow_tls_ipv4" {
    security_group_id = aws_security_group.allow_ssh.id
    ip_protocol = "tcp"
    from_port = 22
    to_port = 22
    cidr_ipv4 = "0.0.0.0/0"
}