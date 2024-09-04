# # terraform.tfvars


ssmautomation = {
    document-name = "MyCustomSSMDocument"
    ssm_document_type = "Automation"
}

eventbridge = {
  region          = "us-west-1"
  account_id      = "12345678"
  document_name   = "MyCustomSSMDocument"
  schedule_expression = "cron(0 13 * * ? *)" # Default is set to 1 PM UTC daily
  schedule_name = "daily-ssm-automation"
  target_id = "ssm-automation"
}
