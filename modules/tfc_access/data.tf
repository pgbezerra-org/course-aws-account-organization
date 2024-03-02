data "tls_certificate" "tfc_certificate" {
  url = "https://${local.tfc_hostname}"
}

data "aws_iam_policy_document" "tfc_assume_role_policy" {
  statement {
    actions = ["sts:AssumeRoleWithWebIdentity"]
    effect  = "Allow"

    principals {
      type        = "Federated"
      identifiers = [aws_iam_openid_connect_provider.tfc_provider.arn]
    }

    condition {
      test     = "StringEquals"
      variable = "${local.tfc_hostname}:aud"
      values   = [one(aws_iam_openid_connect_provider.tfc_provider.client_id_list)]
    }

    condition {
      test     = "StringLike"
      variable = "${local.tfc_hostname}:sub"
      values = [
        for condition in var.aws_tfc_condition : "organization:pgbezerra-courses:${condition}"
      ]
    }
  }
}

data "aws_iam_policy_document" "tfc_policy" {
  statement {
    actions   = ["*"]
    resources = ["*"]
    effect    = "Allow"
  }
}
