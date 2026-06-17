resource "aws_launch_template" "lt-as-2" {
  name_prefix   = "as-2-lt-nginx"
  image_id      = var.ami
  instance_type = var.instance-type
  key_name      = var.key-name

  vpc_security_group_ids = [var.private-instance-sg]

  metadata_options {
    http_endpoint               = "enabled"
    http_tokens                 = "required"
    http_put_response_hop_limit = 1
  }

  #   user_data = base64encode(<<-EOF
  #             #!/bin/bash
  #             apt-get update -y
  #             apt-get install nginx -y
  #             systemctl start nginx
  #             systemctl enable nginx
  #             EOF
  # )

  tag_specifications {
    resource_type = "instance"
    tags = {
      Name        = "as-2-lt-nginx-instance"
      Environment = "dev"
    }
  }

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_autoscaling_group" "asg-as-2" {
  name                      = "as-2-asg-terraform"
  max_size                  = 3
  min_size                  = 1
  health_check_grace_period = 600
  health_check_type         = "EC2"
  desired_capacity          = 1
  vpc_zone_identifier       = [var.Private-subnet-1-id, 
                               var.Private-subnet-2-id, ]

  target_group_arns         = [var.target-group]

  launch_template {
    id      = aws_launch_template.lt-as-2.id
    version = "$Latest"
  }

  instance_refresh {
    strategy = "Rolling"
    preferences {
      min_healthy_percentage = 50
    }
  }

  tag {
    key                 = "Name"
    value               = "Private-asg-worker"
    propagate_at_launch = true
  }

  tag {
    key                 = "Role"
    value               = "webserver"
    propagate_at_launch = true
  }

  tag {
    key                 = "Environment"
    value               = "dev"
    propagate_at_launch = true
  }

  lifecycle {
    create_before_destroy = true
  }
}


resource "aws_autoscaling_policy" "scale_out" {
  name                   = "as-1-nginx-scale-out"
  autoscaling_group_name = aws_autoscaling_group.asg-as-2.name
  adjustment_type        = "ChangeInCapacity"
  scaling_adjustment     = 1
  cooldown               = 300
}

resource "aws_cloudwatch_metric_alarm" "cpu_high-as-1" {
  alarm_name          = "as-1-Cloud-watch-nginx-cpu-high"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = 2
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = 120
  statistic           = "Average"
  threshold           = 50
  alarm_description   = "Scale OUT: CPU >= 50% for 4 minutes"
  alarm_actions       = [aws_autoscaling_policy.scale_out.arn]

  dimensions = {
    AutoScalingGroupName = aws_autoscaling_group.asg-as-2.name
  }
}


resource "aws_autoscaling_policy" "scale_in" {
  name                   = "as-1-nginx-scale-in"
  autoscaling_group_name = aws_autoscaling_group.asg-as-2.name
  adjustment_type        = "ChangeInCapacity"
  scaling_adjustment     = -1
  cooldown               = 300
}

resource "aws_cloudwatch_metric_alarm" "cpu_low-as-1" {
  alarm_name          = "as-1-nginx-cpu-low"
  comparison_operator = "LessThanOrEqualToThreshold"
  evaluation_periods  = 2
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = 120
  statistic           = "Average"
  threshold           = 30
  alarm_description   = "Scale IN: CPU <= 30% for 4 minutes"
  alarm_actions       = [aws_autoscaling_policy.scale_in.arn]

  dimensions = {
    AutoScalingGroupName = aws_autoscaling_group.asg-as-2.name
  }
}

# resource "time_sleep" "wait_45_seconds" {
#   depends_on      = [aws_autoscaling_group.asg-as-2]
#   create_duration = "45s" 
# }

# resource "terraform_data" "generate_inventory" {
#   triggers_replace = {
#     always_run = timestamp() 
#   }

#   provisioner "local-exec" {
#     command = <<EOT
#       echo "Waiting briefly for AWS networking interfaces..."
#       sleep 5
#       echo "Querying live AWS API for running instances with tag 'Private-asg-worker'..."
      
#       echo "[webservers]" > ${path.root}/inventory.ini
      
#       aws ec2 describe-instances \
#         --filters "Name=tag:Name,Values=Private-asg-worker" "Name=instance-state-name,Values=running" \
#         --query "Reservations[*].Instances[*].PrivateIpAddress" \
#         --output text | tr '\t' '\n' >> ${path.root}/inventory.ini
        
#       echo "--- Final Generated inventory.ini content ---"
#       cat ${path.root}/inventory.ini
#     EOT
#   }

#   depends_on = [time_sleep.wait_45_seconds]
# }

# data "aws_instances" "asg_workers" {
#   filter {
#     name   = "tag:Name"
#     values = ["Private-asg-worker"]
#   }

#   filter {
#     name   = "instance-state-name"
#     values = ["running"]
#   }

#   depends_on = [time_sleep.wait_45_seconds]
# }