variable "alert_email" {
  description = "Email address that receives CloudWatch alerts"
  type        = string
  sensitive   = true
}

resource "aws_sns_topic" "alerts" {
  name = "${var.project_name}-alerts"

  tags = {
    Project   = var.project_name
    ManagedBy = "Terraform"
  }
}

resource "aws_sns_topic_subscription" "email" {
  topic_arn = aws_sns_topic.alerts.arn
  protocol  = "email"
  endpoint  = var.alert_email
}

resource "aws_cloudwatch_metric_alarm" "high_cpu" {
  alarm_name          = "${var.project_name}-high-cpu"
  alarm_description   = "EC2 CPU utilization is above 70 percent"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = 1
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = 300
  statistic           = "Average"
  threshold           = 70
  treat_missing_data  = "notBreaching"

  dimensions = {
    InstanceId = aws_instance.app.id
  }

  alarm_actions = [aws_sns_topic.alerts.arn]

  tags = {
    Project   = var.project_name
    ManagedBy = "Terraform"
  }
}