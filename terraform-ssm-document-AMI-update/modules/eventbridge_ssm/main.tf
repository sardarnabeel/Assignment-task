# EventBridge Rule to trigger SSM Automation on a schedule
resource "aws_cloudwatch_event_rule" "ssm_automation_schedule" {
  name                = "daily-ssm-automation"
  description         = "Triggers SSM Automation Document every day at a specific time"
  schedule_expression = "cron(0 13 * * ? *)" # This expression represents 1 PM UTC daily

}

# EventBridge Target
resource "aws_cloudwatch_event_target" "ssm_automation_target" {
  rule      = aws_cloudwatch_event_rule.ssm_automation_schedule.name
  target_id = "ssm-automation"
  arn     = "arn:aws:ssm:${var.eventbridge.region}:${var.custom.account_id}:automation-definition/${var.eventbridge.document_name}"
  role_arn = aws_iam_role.eventbridge_ssm_role.arn

  input = jsonencode({
    DocumentName = var.eventbridge.document_name
  })
}
