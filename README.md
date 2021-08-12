## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_cloudtrail.expel](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudtrail) | resource |
| [aws_iam_policy.ExpelAPIPolicy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_policy_attachment.ExpelAPIPolicy-policy-attachment](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy_attachment) | resource |
| [aws_iam_role.ExpelServiceRole](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_instance.ExpelAssemblerInstance](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/instance) | resource |
| [aws_kms_alias.expel-cloudtrail](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/kms_alias) | resource |
| [aws_kms_key.expel](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/kms_key) | resource |
| [aws_s3_bucket.expel-cloudtrail-logs](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket) | resource |
| [aws_s3_bucket_notification.expel](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_notification) | resource |
| [aws_s3_bucket_policy.expel-cloudtrail-logs-policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_policy) | resource |
| [aws_sqs_queue.expel-sqs-notification](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/sqs_queue) | resource |
| [aws_sqs_queue_policy.expel-sqs-policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/sqs_queue_policy) | resource |
| [aws_ami.ExpelAssembler](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/ami) | data source |
| [aws_caller_identity.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/caller_identity) | data source |
| [aws_subnet.internal](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/subnet) | data source |
| [aws_vpc.selected](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/vpc) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_assember_instance_size"></a> [assember\_instance\_size](#input\_assember\_instance\_size) | n/a | `string` | `"t2.large"` | no |
| <a name="input_assembler_key"></a> [assembler\_key](#input\_assembler\_key) | n/a | `string` | `""` | no |
| <a name="input_assembler_subnet"></a> [assembler\_subnet](#input\_assembler\_subnet) | n/a | `string` | `""` | no |
| <a name="input_assembler_vpc"></a> [assembler\_vpc](#input\_assembler\_vpc) | n/a | `string` | `""` | no |
| <a name="input_aws_region"></a> [aws\_region](#input\_aws\_region) | n/a | `string` | `"us-west-1"` | no |
| <a name="input_component"></a> [component](#input\_component) | n/a | `string` | `"expel"` | no |
| <a name="input_enable_assembler"></a> [enable\_assembler](#input\_enable\_assembler) | n/a | `bool` | `false` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_AssemblerIP"></a> [AssemblerIP](#output\_AssemblerIP) | n/a |
| <a name="output_AssemblerInstanceID"></a> [AssemblerInstanceID](#output\_AssemblerInstanceID) | n/a |
| <a name="output_Region"></a> [Region](#output\_Region) | n/a |
| <a name="output_RoleARN"></a> [RoleARN](#output\_RoleARN) | n/a |
| <a name="output_RoleSessionName"></a> [RoleSessionName](#output\_RoleSessionName) | n/a |
| <a name="output_SQSURL"></a> [SQSURL](#output\_SQSURL) | n/a |
