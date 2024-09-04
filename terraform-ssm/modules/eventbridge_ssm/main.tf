# IAM Role for EventBridge to assume and execute SSM Automation
resource "aws_iam_role" "eventbridge_ssm_role" {
  name = "eventbridge-ssm-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect = "Allow",
        Principal = {
          Service = "events.amazonaws.com"
        },
        Action = "sts:AssumeRole"
      }
    ]
  })
}

# IAM Policy to Allow EventBridge to Start SSM Automation Execution
resource "aws_iam_role_policy" "eventbridge_ssm_policy" {
  name   = "eventbridge-ssm-policy"
  role   = aws_iam_role.eventbridge_ssm_role.id
  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect = "Allow",
        Action = [
          "ssm:StartAutomationExecution"
        ],
        Resource = "arn:aws:ssm:us-west-1:*:automation-definition/MyCustomSSMDocument:*"
      },
      {
        Effect = "Allow",
        Action = [
          "iam:PassRole"
        ],
        Resource = aws_iam_role.eventbridge_ssm_role.arn,
        Condition = {
          StringLikeIfExists = {
            "iam:PassedToService" = "ssm.amazonaws.com"
          }
        }
      }
    ]
  })
}

# EventBridge Rule to trigger SSM Automation on a schedule
resource "aws_cloudwatch_event_rule" "ssm_automation_schedule" {
  name                = "daily-ssm-automation"
  description         = "Triggers SSM Automation Document every day at a specific time"
  schedule_expression = "cron(0 13 * * ? *)" # This expression represents 1 PM UTC daily

  # Ensure the schedule matches your desired time zone. Adjust for PST.
}

# EventBridge Target to specify the SSM Automation Document to run
resource "aws_cloudwatch_event_target" "ssm_automation_target" {
  rule      = aws_cloudwatch_event_rule.ssm_automation_schedule.name
  target_id = "ssm-automation"
  arn       = "arn:aws:ssm:us-west-1:944347495097:automation-definition/MyCustomSSMDocument" # Replace with your Automation Document ARN
# arn     = "arn:aws:ssm:${var.region}:${var.account_id}:automation-definition/${var.document_name}"
  role_arn = aws_iam_role.eventbridge_ssm_role.arn

  input = jsonencode({
    DocumentName = "MyCustomSSMDocument",
    # DocumentName = var.document_name
  })
}
