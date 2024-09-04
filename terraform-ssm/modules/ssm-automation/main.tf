resource "aws_ssm_document" "automation_document" {
  name          = var.document_name
  document_type  = "Automation"
  content        = file("${path.module}/patch_and_create_ami.json")
  tags = {
    Name = var.document_name
  }
}


# # Define the ManagedInstanceRole
# resource "aws_iam_role" "managed_instance_role" {
#   name = "ManagedInstanceRole"

#   assume_role_policy = jsonencode({
#     Version = "2012-10-17"
#     Statement = [
#       {
#         Effect = "Allow"
#         Principal = {
#           Service = "ec2.amazonaws.com"
#         }
#         Action = "sts:AssumeRole"
#       }
#     ]
#   })
# }

# # Attach the AmazonEC2RoleforSSM policy to ManagedInstanceRole
# resource "aws_iam_role_policy_attachment" "managed_instance_role_ec2_ssm" {
#   role       = aws_iam_role.managed_instance_role.name
#   policy_arn  = "arn:aws:iam::aws:policy/AmazonEC2RoleforSSM"
# }

# # Attach the AmazonManagedInstanceCore policy to ManagedInstanceRole
# resource "aws_iam_role_policy_attachment" "managed_instance_role_managed_instance_core" {
#   role       = aws_iam_role.managed_instance_role.name
#   policy_arn  = "arn:aws:iam::aws:policy/AmazonManagedInstanceCore"
# }

# # Define the AutomationserviceRole
# resource "aws_iam_role" "automation_service_role" {
#   name = "AutomationserviceRole"

#   assume_role_policy = jsonencode({
#     Version = "2012-10-17"
#     Statement = [
#       {
#         Effect = "Allow"
#         Principal = {
#           Service = "ssm.amazonaws.com"
#         }
#         Action = "sts:AssumeRole"
#       }
#     ]
#   })
# }

# # Attach the AmazonSSMAutomationRole policy to AutomationserviceRole
# resource "aws_iam_role_policy_attachment" "automation_service_role_ssm_automation" {
#   role       = aws_iam_role.automation_service_role.name
#   policy_arn  = "arn:aws:iam::aws:policy/AmazonSSMAutomationRole"
# }

# # Attach the AmazonManagedInstanceCore policy to AutomationserviceRole
# resource "aws_iam_role_policy_attachment" "automation_service_role_managed_instance_core" {
#   role       = aws_iam_role.automation_service_role.name
#   policy_arn  = "arn:aws:iam::aws:policy/AmazonManagedInstanceCore"
# }

# # Define the custom policy for AutomationserviceRole
# resource "aws_iam_policy" "custom_policy" {
#   name        = "CustomAutomationServicePolicy"
#   description = "Custom policy to allow iam:PassRole for ManagedInstanceRole"

#   policy = jsonencode({
#     Version = "2012-10-17"
#     Statement = [
#       {
#         Sid    = "Statement1"
#         Effect = "Allow"
#         Action = "iam:PassRole"
#         Resource = "arn:aws:iam::944347495097:role/ManagedInstanceRole"
#       }
#     ]
#   })
# }

# # Attach the custom policy to AutomationserviceRole
# resource "aws_iam_role_policy_attachment" "automation_service_role_custom_policy" {
#   role       = aws_iam_role.automation_service_role.name
#   policy_arn  = aws_iam_policy.custom_policy.arn
# }
