output "document_name" {
  description = "The name of the SSM Automation Document."
  value       = aws_ssm_document.automation_document.name
}
output "document-arn" {
  value = aws_ssm_document.automation_document.arn
}
