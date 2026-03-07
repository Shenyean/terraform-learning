resource "aws_sns_topic" "alert_topic" {
  name="${var.name_prefix}-alert-sns-topic"
}