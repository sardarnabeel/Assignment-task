provider "aws" {
  # version    = "~> 4.0"
  region     = "us-west-1"
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
}
