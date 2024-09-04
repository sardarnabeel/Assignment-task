module "ssm_automation" {
  source       = "./modules/ssm-automation"
  document_name = "MyCustomSSMDocument"
}

output "automation_document_name" {
   value = module.ssm_automation.document_name
   }



module "eventbridge_ssm" {
  source          = "./modules/eventbridge_ssm"
}
