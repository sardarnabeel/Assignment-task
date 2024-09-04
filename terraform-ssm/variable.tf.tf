# Define variables for access and secret keys if needed
variable "aws_access_key" {
  description = "AWS access key"
  type        = string
  sensitive   = true
  default     = "aaaaaaaaaaaaaaaaaaaa" 
}

variable "aws_secret_key" {
  description = "AWS secret key"
  type        = string
  sensitive   = true
  default     = "aaaaaaaaaaaaaaaaaaaaaaaaaa" 
}
