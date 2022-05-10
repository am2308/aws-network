resource "aws_lb" "test-alb" {
  name               = "test-lb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [var.security_group]
  subnets            = [var.subnet_id]

  enable_deletion_protection = var.delete_protection_enable

  access_logs {
    bucket  = var.bucket_name
    prefix  = "test-lb"
    enabled = true
  }

  tags = var.tags
}

resource "aws_lb_listener" "front_end" {
  load_balancer_arn = aws_lb.test-alb.arn
  port              = "443"
  protocol          = "HTTPS"
  ssl_policy        = "ELBSecurityPolicy-TLS-1-2-2017-01"
  certificate_arn   = ""

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.front_end.arn
  }
  depends_on = [aws_lb_target_group.front_end]
}

resource "aws_lb_target_group" "front_end" {
  name     = "test-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = var.vpc_id
  tags     = var.tags
}

resource "aws_lb_target_group_attachment" "front_end" {
  target_group_arn = aws_lb_target_group.front_end.arn
  target_id        = var.ec2_id
  port             = 80
  depends_on       = [aws_lb_target_group.front_end]
}


