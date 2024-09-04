resource "aws_ssm_document" "automation_document" {
  name          = var.ssmautomation.document-name
  document_type  = "Automation"
  content        = file("${path.module}/patch_and_create_ami.json")
  tags = {
    Name = var.ssmautomation.document-name
  }
}