# IAM Role for EventBridge
resource "aws_iam_role" "eventbridge_ssm_role" {
  name               = "eventbridge-ssm-role"
  assume_role_policy = file("${path.module}/role_assume_policy.json")
}

# IAM Policy to Allow EventBridge 
resource "aws_iam_role_policy" "eventbridge_ssm_policy" {
  name   = "eventbridge-ssm-policy"
  role   = aws_iam_role.eventbridge_ssm_role.id
  policy = file("${path.module}/ssm_policy.json")
}