output "ec2_security_group" {
    value = aws_security_group.default-ec2-sg.id
}
