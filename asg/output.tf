output "launch-template" {
  value = aws_launch_template.lt-as-2
}

output "auto-scalling" {
  value = aws_autoscaling_group.asg-as-2
}

output "autoscaling-policy-in" {
  value = aws_autoscaling_policy.scale_in
}

output "cloudwatch" {
  value = aws_cloudwatch_metric_alarm.cpu_high-as-1
}