resource "aws_lb" "as-2-alb" {
  name               = "as-2-lb-tf"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [var.alb-sg]
  subnets            = [
    var.Public-subnet-1-id,
    var.Public-subnet-2-id,
  ]

  enable_deletion_protection = false

  tags = {
    Environment = "as-2-alb-nginx"
  }
}

resource "aws_lb_target_group" "lb-target-v2" {
  name        = "as-2-lb-alb-v2"
  target_type = "instance"
  port        = 80
  protocol    = "HTTP"
  vpc_id      = var.vpc-id

  health_check {
    enabled             = true
    path                = "/"
    protocol            = "HTTP"
    matcher             = "200"
    interval            = 30
    timeout             = 5
    healthy_threshold   = 3
    unhealthy_threshold = 3
  }

  lifecycle {
    create_before_destroy = false
  }

  tags = {
    Name = "as-2-tg"
  }
}

resource "aws_lb_listener" "http_listener" {
  load_balancer_arn = aws_lb.as-2-alb.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.lb-target-v2.arn
  }
}