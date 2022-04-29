##This resource will create security group to attch with ec2
resource "aws_security_group" "default-ec2-sg" {
  name = var.security_group_name
  vpc_id = var.vpc_id

  // To Allow SSH Transport
  ingress {
    from_port = 22
    protocol = "tcp"
    to_port = 22
    cidr_blocks = var.ingress_cidr
  }

  tags = merge(
    {
      "Name" = var.security_group_name
    },
    var.tags
  )

  lifecycle {
    create_before_destroy = true
  }
}

