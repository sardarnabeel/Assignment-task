# Define variables for access and secret keys if needed
variable "aws_access_key" {
  type        = string
  sensitive   = true
  default     = "aaaaaaaaaaaaaaaaaaaa" 
}

variable "aws_secret_key" {
  type        = string
  sensitive   = true
  default     = "aaaaaaaaaaaaaaaaaaaaaaaaaa" 
}
variable "document_name" {
  
}


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