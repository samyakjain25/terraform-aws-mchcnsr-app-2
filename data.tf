data "aws_caller_identity" "current" {}

data "aws_route53_zone" "selected" {
  zone_id = "${var.route53_private_zone_id}"
}

data "aws_region" "current" {}

data "aws_subnet_ids" "service_subnet_tier" {
  vpc_id = "${var.vpc_id}"

  tags {
    Tier = "app"
  }
}

data "aws_iam_policy_document" "app" {
  statement {
    effect = "Allow"

    actions = [
      "ssm:GetParameter",
      "ssm:GetParameterHistory",
      "ssm:GetParameters",
      "ssm:GetParametersByPath",
    ]

    resources = [
      "arn:aws:ssm:*:${data.aws_caller_identity.current.account_id}:parameter/tvlk-secret/${local.service_name}/*",
    ]
  }
}

data "aws_iam_policy_document" "idgen_seed" {
 statement {
   effect = "Allow"

   actions = [
     "dynamodb:PutItem",
     "dynamodb:UpdateItem",
   ]

   resources = [
     "${var.idgen_seed_arn}"
   ]
 }
}
