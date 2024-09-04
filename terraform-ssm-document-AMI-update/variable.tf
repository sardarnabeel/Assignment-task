# Define variables for access and secret keys if needed


variable "eventbridge" {
  type = object({
    region      = string
    account_id  = string
    document_name = string
    schedule_expression = string
    schedule_name = string
    target_id = string
  })
}


variable "ssmautomation" {
  type = object({
    document-name = string
    ssm_document_type = string
  })
}