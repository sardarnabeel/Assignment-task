# # terraform.tfvars

#provider variable key value
aws_access_key = "aaaaaaaaaaaaaaaaaaaaa"
aws_secret_key = "aaaaaaaaaaaaaaaaaa"


ssm-automation = {
    document-name = "MyCustomSSMDocument"
}

eventbridge = {
  region          = "us-west-1"
  account_id      = "12345678"
  document_name   = "MyCustomSSMDocument"
# automation_role = "AutomationServiceRole"
}
