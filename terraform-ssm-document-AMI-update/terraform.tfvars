# # terraform.tfvars


ssmautomation = {
    document-name = "MyCustomSSMDocument"
}

eventbridge = {
  region          = "us-west-1"
  account_id      = "12345678"
  document_name   = "MyCustomSSMDocument"
# automation_role = "AutomationServiceRole"
}
