# Module TFC access

This module creates the AWS IAM role and the Terraform Cloud OAuth client to allow the Terraform Cloud to assume the role and manage the AWS account.

The output of this module is the ARN of the IAM role that will be used by the Terraform Cloud to manage the AWS account.

You can use that ARN to inject the role into the Terraform AWS provider and manage the AWS account using Terraform Cloud.

<!-- BEGIN_TF_DOCS -->


## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |
| <a name="provider_tls"></a> [tls](#provider\_tls) | n/a |

## Resources

| Name | Type |
|------|------|
| [aws_iam_openid_connect_provider.tfc_provider](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_openid_connect_provider) | resource |
| [aws_iam_policy.tfc_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_role.tfc_role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role_policy_attachment.tfc_policy_attachment](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_policy_document.tfc_assume_role_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.tfc_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [tls_certificate.tfc_certificate](https://registry.terraform.io/providers/hashicorp/tls/latest/docs/data-sources/certificate) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_aws_tfc_condition"></a> [aws\_tfc\_condition](#input\_aws\_tfc\_condition) | The condition to be used in the TFC policy document to allow the role to assume<br>the role. The organization is automatically added to the condition. But you<br>should do something like this: `project:my-project-name:workspace:*:run_phase:*`.<br><br>You can many conditions. | `list(string)` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_tfc_role_arn"></a> [tfc\_role\_arn](#output\_tfc\_role\_arn) | AWS role to assume to run Terraform Cloud workspaces. |
<!-- END_TF_DOCS -->