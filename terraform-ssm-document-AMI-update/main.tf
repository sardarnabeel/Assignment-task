module "ssm_automation" {
  source       = "./modules/ssm-automation"
  ssmautomation = var.ssmautomation
}




module "eventbridge_ssm" {
  source          = "./modules/eventbridge_ssm"
  eventbridge = var.eventbridge
  
}

output "automation_document_name" {
   value = module.ssm_automation.document_name
   }
