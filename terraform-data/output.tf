output "ec2_public_ip" {
  value = aws_instance.public.public_dns
}
