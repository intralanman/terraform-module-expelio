output "RoleARN" {
  value = aws_iam_role.ExpelServiceRole.arn
}

output "RoleSessionName" {
  value = "aws-expel-${data.aws_caller_identity.current.account_id}"
}

output "Region" {
  value = var.aws_region
}

output "SQSURL" {
  value = aws_sqs_queue.expel-sqs-notification.id
}

output "AssemblerIP" {
  value = aws_instance.ExpelAssemblerInstance[0].private_ip
}

output "AssemblerInstanceID" {
  value = aws_instance.ExpelAssemblerInstance[0].id
}
