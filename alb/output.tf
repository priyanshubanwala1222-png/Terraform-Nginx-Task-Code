output "Load-balancer" {
  value = aws_lb.as-2-alb.id
}

output "target-group" {
  value = aws_lb_target_group.lb-target-v2.id
}

output "lb-http" {
  value = aws_lb_listener.http_listener
}