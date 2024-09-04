# Define variables for access and secret keys if needed


variable "eventbridge" {
  type = object({
    region      = string
    account_id  = string
    document_name = string
  })
}


variable "ssmautomation" {
  type = object({
    document-name = string
  })
}