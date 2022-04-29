output "private_ip" {
  value = aws_eip.default-ec2-private-ip.private_ip
}
