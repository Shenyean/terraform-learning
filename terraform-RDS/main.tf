resource "aws_instance" "rds-main" {
  instance_type          = var.instance_type
  ami                    = var.ami_id
  key_name               = "yeosy-1203"
  vpc_security_group_ids = [aws_security_group.ec2_sg.id]
  tags = {
    Name = "yeosy-dynamoDB-instance"
  }
  subnet_id = "subnet-09764c1ffd6520a2f"
}
resource "aws_security_group" "ec2_sg" {
  name        = "ec2-sg"
  description = "Security group for EC2 instance"
  vpc_id      = "vpc-0b5e667ab2645cda4"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # Restrict to your IP in production
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "ec2-sg"
  }
}
