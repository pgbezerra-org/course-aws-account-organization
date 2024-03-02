locals {
  tfc_hostname     = "app.terraform.io"
  tfc_aws_audience = "aws.workload.identity"
}

resource "aws_iam_openid_connect_provider" "tfc_provider" {
  url             = data.tls_certificate.tfc_certificate.url
  client_id_list  = [local.tfc_aws_audience]
  thumbprint_list = [data.tls_certificate.tfc_certificate.certificates[0].sha1_fingerprint]
}

resource "aws_iam_role" "tfc_role" {
  name               = "tfc-role"
  assume_role_policy = data.aws_iam_policy_document.tfc_assume_role_policy.json
}

resource "aws_iam_policy" "tfc_policy" {
  name        = "tfc-policy"
  description = "TFC run policy"
  policy      = data.aws_iam_policy_document.tfc_policy.json
}

resource "aws_iam_role_policy_attachment" "tfc_policy_attachment" {
  role       = aws_iam_role.tfc_role.name
  policy_arn = aws_iam_policy.tfc_policy.arn
}
