######################
### Prefixed Names ###
######################

module "lb_sg_name" {
  source        = "github.com/traveloka/terraform-aws-resource-naming?ref=v0.17.0"
  name_prefix   = "${local.lbint_cluster_name}"
  resource_type = "security_group"
}


#######################
### ALB Security Groups ###
#######################

resource "aws_security_group" "lb_sg" {
  name        = "${module.lb_sg_name.name}"
  vpc_id      = "${var.vpc_id}"
  description = "internal  ${local.service_name} ${local.lb_cluster_role} security group"

  tags {
    Name          = "${module.lb_sg_name.name}"
    Service       = "${local.service_name}"
    ProductDomain = "${local.product_domain}"
    Environment   = "${var.environment}"
    Description   = "Security group for ${local.service_name}-${var.cluster_role}"
    ManagedBy     = "terraform"
  }
}


#############################
### Security Groups Rules ###
#############################

resource "aws_security_group_rule" "allow_egress_from_mchcnsr_lb_to_mchcnsr_app" {
  security_group_id        = "${aws_security_group.lb_sg.id}"
  type                     = "egress"
  protocol                 = "tcp"
  from_port                = "${local.app_port}"
  to_port                  = "${local.app_port}"
  source_security_group_id = "${aws_security_group.app_sg.id}"
}

resource "aws_security_group_rule" "allow_ingress_from_mchcnsr_lb_to_mchcnsr_app" {
  security_group_id        = "${aws_security_group.app_sg.id}"
  type                     = "ingress"
  protocol                 = "tcp"
  from_port                = "${local.app_port}"
  to_port                  = "${local.app_port}"
  source_security_group_id = "${aws_security_group.lb_sg.id}"
}

resource "aws_security_group_rule" "allow_egress_from_mchcnsr_app_to_mchdata_lb" {
  security_group_id        = "${aws_security_group.app_sg.id}"
  type                     = "egress"
  protocol                 = "tcp"
  from_port                = "${local.secure_port}"
  to_port                  = "${local.secure_port}"
  source_security_group_id = "${var.mchdata_lb_sg_id}"
}

resource "aws_security_group_rule" "allow_ingress_from_mchcnsr_app_to_mchdata_lb" {
  security_group_id        = "${var.mchdata_lb_sg_id}"
  type                     = "ingress"
  from_port                = "${local.secure_port}"
  to_port                  = "${local.secure_port}"
  protocol                 = "tcp"
  source_security_group_id = "${aws_security_group.app_sg.id}"
}

resource "aws_security_group_rule" "allow_ingress_from_mchcnsr_app_to_mchitmp_lb" {
  security_group_id        = "${var.mchitmp_lb_sg_id}"
  type                     = "ingress"
  from_port                = "${local.secure_port}"
  to_port                  = "${local.secure_port}"
  protocol                 = "tcp"
  source_security_group_id = "${aws_security_group.app_sg.id}"
}

resource "aws_security_group_rule" "allow_egress_from_mchcnsr_app_to_mchitmp_lb" {
  security_group_id        = "${aws_security_group.app_sg.id}"
  type                     = "egress"
  protocol                 = "tcp"
  from_port                = "${local.secure_port}"
  to_port                  = "${local.secure_port}"
  source_security_group_id = "${var.mchitmp_lb_sg_id}"
}

resource "aws_security_group_rule" "allow_ingress_from_mchcnsr_app_to_mchcntr_lb" {
  security_group_id        = "${var.mchcntr_lb_sg_id}"
  type                     = "ingress"
  from_port                = "${local.secure_port}"
  to_port                  = "${local.secure_port}"
  protocol                 = "tcp"
  source_security_group_id = "${aws_security_group.app_sg.id}"
}

resource "aws_security_group_rule" "allow_egress_from_mchcnsr_app_to_mchcntr_lb" {
  security_group_id        = "${aws_security_group.app_sg.id}"
  type                     = "egress"
  protocol                 = "tcp"
  from_port                = "${local.secure_port}"
  to_port                  = "${local.secure_port}"
  source_security_group_id = "${var.mchcntr_lb_sg_id}"
}

resource "aws_security_group_rule" "allow_ingress_from_mchcnsr_app_to_mchitmd_lb" {
  security_group_id        = "${var.mchitmd_lb_sg_id}" 
  type                     = "ingress"
  from_port                = "${local.secure_port}"
  to_port                  = "${local.secure_port}"
  protocol                 = "tcp"
  source_security_group_id = "${aws_security_group.app_sg.id}"
}

resource "aws_security_group_rule" "allow_egress_from_mchcnsr_app_to_mchitmd_lb" {
  security_group_id        = "${aws_security_group.app_sg.id}"
  type                     = "egress"
  protocol                 = "tcp"
  from_port                = "${local.secure_port}"
  to_port                  = "${local.secure_port}"
  source_security_group_id = "${var.mchitmd_lb_sg_id}"
}

# Ideally its not required as it was required for scheduled distributed job
resource "aws_security_group_rule" "allow_egress_from_mchcnsr_app_to_mchdata_mongo" {
  security_group_id        = "${aws_security_group.app_sg.id}"
  type                     = "egress"
  protocol                 = "tcp"
  from_port                = "${local.mongo_port}"
  to_port                  = "${local.mongo_port}"
  source_security_group_id = "${var.mchdata_mongo_sg_id}"
}

resource "aws_security_group_rule" "allow_ingress_from_mchcnsr_app_to_mchdata_mongo" {
  security_group_id        = "${var.mchdata_mongo_sg_id}"
  type                     = "ingress"
  protocol                 = "tcp"
  from_port                = "${local.mongo_port}"
  to_port                  = "${local.mongo_port}"
  source_security_group_id = "${aws_security_group.app_sg.id}"
}

resource "aws_security_group_rule" "allow_egress_from_mchcnsr_app_to_mchjob_redis" {
  security_group_id        = "${aws_security_group.app_sg.id}"
  type                     = "egress"
  protocol                 = "tcp"
  from_port                = "${local.redis_port}"
  to_port                  = "${local.redis_port}"
  source_security_group_id = "${var.mchjob_redis_sg_id}"
}

resource "aws_security_group_rule" "allow_ingress_from_mchcnsr_app_to_mchjob_redis" {
  security_group_id        = "${var.mchjob_redis_sg_id}"
  type                     = "ingress"
  protocol                 = "tcp"
  from_port                = "${local.redis_port}"
  to_port                  = "${local.redis_port}"
  source_security_group_id = "${aws_security_group.app_sg.id}"
}

resource "aws_security_group_rule" "allow_ingress_from_mchcnsr_app_to_locgs_vpce" {
  type      = "ingress"
  from_port = "${local.nlb_port}"
  to_port   = "${local.nlb_port}"
  protocol  = "tcp"

  source_security_group_id = "${aws_security_group.app_sg.id}"
  security_group_id        = "${var.locgs_vpce_sg_id}"
}

resource "aws_security_group_rule" "allow_egress_from_mchcnsr_app_to_locgs_vpce" {
  type                     = "egress"
  from_port                = "${local.nlb_port}"
  to_port                  = "${local.nlb_port}"
  protocol                 = "tcp"
  security_group_id        = "${aws_security_group.app_sg.id}"
  source_security_group_id = "${var.locgs_vpce_sg_id}"
}

resource "aws_security_group_rule" "allow_ingress_from_mchcnsr_app_to_culsrch_vpce" {
  type      = "ingress"
  from_port = "${local.nlb_port}"
  to_port   = "${local.nlb_port}"
  protocol  = "tcp"

  source_security_group_id = "${aws_security_group.app_sg.id}"
  security_group_id        = "${var.culsrch_vpce_sg_id}"
}

resource "aws_security_group_rule" "allow_egress_from_mchcnsr_app_to_culsrch_vpce" {
  type                     = "egress"
  from_port                = "${local.nlb_port}"
  to_port                  = "${local.nlb_port}"
  protocol                 = "tcp"
  security_group_id        = "${aws_security_group.app_sg.id}"
  source_security_group_id = "${var.culsrch_vpce_sg_id}"
}

resource "aws_security_group_rule" "allow_ingress_from_mchcnsr_app_to_srssrch_vpce" {
  type      = "ingress"
  from_port = "${local.nlb_port}"
  to_port   = "${local.nlb_port}"
  protocol  = "tcp"

  source_security_group_id = "${aws_security_group.app_sg.id}"
  security_group_id        = "${var.srssrch_vpce_sg_id}"
}

resource "aws_security_group_rule" "allow_egress_from_mchcnsr_app_to_srssrch_vpce" {
  type                     = "egress"
  from_port                = "${local.nlb_port}"
  to_port                  = "${local.nlb_port}"
  protocol                 = "tcp"
  security_group_id        = "${aws_security_group.app_sg.id}"
  source_security_group_id = "${var.srssrch_vpce_sg_id}"
}

resource "aws_security_group_rule" "allow_ingress_from_mchcnsr_app_to_cntres_vpce" {
  type      = "ingress"
  from_port = "${local.nlb_port}"
  to_port   = "${local.nlb_port}"
  protocol  = "tcp"

  source_security_group_id = "${aws_security_group.app_sg.id}"
  security_group_id        = "${var.cntres_vpce_sg_id}"
}

resource "aws_security_group_rule" "allow_egress_from_mchcnsr_app_to_cntres_vpce" {
  type                     = "egress"
  from_port                = "${local.nlb_port}"
  to_port                  = "${local.nlb_port}"
  protocol                 = "tcp"
  security_group_id        = "${aws_security_group.app_sg.id}"
  source_security_group_id = "${var.cntres_vpce_sg_id}"
}

resource "aws_security_group_rule" "allow_ingress_from_mchcnsr_app_to_cntcms_vpce" {
  type      = "ingress"
  from_port = "${local.nlb_port}"
  to_port   = "${local.nlb_port}"
  protocol  = "tcp"

  source_security_group_id = "${aws_security_group.app_sg.id}"
  security_group_id        = "${var.cntcms_vpce_sg_id}"
}

resource "aws_security_group_rule" "allow_egress_from_mchcnsr_app_to_cntcms_vpce" {
  type                     = "egress"
  from_port                = "${local.nlb_port}"
  to_port                  = "${local.nlb_port}"
  protocol                 = "tcp"
  security_group_id        = "${aws_security_group.app_sg.id}"
  source_security_group_id = "${var.cntcms_vpce_sg_id}"
}

resource "aws_security_group_rule" "allow_ingress_from_mchcnsr_app_to_fprinv_vpce" {
  type      = "ingress"
  from_port = "${local.nlb_port}"
  to_port   = "${local.nlb_port}"
  protocol  = "tcp"

  source_security_group_id = "${aws_security_group.app_sg.id}"
  security_group_id        = "${var.fprinv_vpce_sg_id}"
}

resource "aws_security_group_rule" "allow_egress_from_mchcnsr_app_to_fprinv_vpce" {
  type                     = "egress"
  from_port                = "${local.nlb_port}"
  to_port                  = "${local.nlb_port}"
  protocol                 = "tcp"
  security_group_id        = "${aws_security_group.app_sg.id}"
  source_security_group_id = "${var.fprinv_vpce_sg_id}"
}

resource "aws_security_group_rule" "allow_ingress_from_mchcnsr_app_to_xpesrch_vpce" {
  type      = "ingress"
  from_port = "${local.nlb_port}"
  to_port   = "${local.nlb_port}"
  protocol  = "tcp"

  source_security_group_id = "${aws_security_group.app_sg.id}"
  security_group_id        = "${var.xpesrch_vpce_sg_id}"
}

resource "aws_security_group_rule" "allow_egress_from_mchcnsr_app_to_xpesrch_vpce" {
  type                     = "egress"
  from_port                = "${local.nlb_port}"
  to_port                  = "${local.nlb_port}"
  protocol                 = "tcp"
  security_group_id        = "${aws_security_group.app_sg.id}"
  source_security_group_id = "${var.xpesrch_vpce_sg_id}"
}

resource "aws_security_group_rule" "allow_ingress_from_mchcnsr_app_to_recqry_vpce" {
  type      = "ingress"
  from_port = "${local.nlb_port}"
  to_port   = "${local.nlb_port}"
  protocol  = "tcp"

  source_security_group_id = "${aws_security_group.app_sg.id}"
  security_group_id        = "${var.recqry_vpce_sg_id}"
}

resource "aws_security_group_rule" "allow_egress_from_mchcnsr_app_to_recqry_vpce" {
  type      = "egress"
  from_port = "${local.nlb_port}"
  to_port   = "${local.nlb_port}"
  protocol  = "tcp"

  security_group_id        = "${aws_security_group.app_sg.id}"
  source_security_group_id = "${var.recqry_vpce_sg_id}"
}

resource "aws_security_group_rule" "allow_ingress_from_mchcnsr_app_to_recsys_vpce" {
  type      = "ingress"
  from_port = "${local.nlb_port}"
  to_port   = "${local.nlb_port}"
  protocol  = "tcp"

  source_security_group_id = "${aws_security_group.app_sg.id}"
  security_group_id        = "${var.recsys_vpce_sg_id}"
}

resource "aws_security_group_rule" "allow_egress_from_mchcnsr_app_to_recsys_vpce" {
  type      = "egress"
  from_port = "${local.nlb_port}"
  to_port   = "${local.nlb_port}"
  protocol  = "tcp"

  security_group_id        = "${aws_security_group.app_sg.id}"
  source_security_group_id = "${var.recsys_vpce_sg_id}"
}

resource "aws_security_group_rule" "allow_ingress_from_mchcnsr_app_to_ptswlt_vpce" {
  type      = "ingress"
  from_port = "${local.nlb_port}"
  to_port   = "${local.nlb_port}"
  protocol  = "tcp"

  source_security_group_id = "${aws_security_group.app_sg.id}"
  security_group_id        = "${var.ptswlt_vpce_sg_id}"
}

resource "aws_security_group_rule" "allow_egress_from_mchcnsr_app_to_ptswlt_vpce" {
  type      = "egress"
  from_port = "${local.nlb_port}"
  to_port   = "${local.nlb_port}"
  protocol  = "tcp"

  security_group_id        = "${aws_security_group.app_sg.id}"
  source_security_group_id = "${var.ptswlt_vpce_sg_id}"
}

resource "aws_security_group_rule" "allow_ingress_from_mchcnsr_app_to_paywlt_vpce" {
  type      = "ingress"
  from_port = "${local.nlb_port}"
  to_port   = "${local.nlb_port}"
  protocol  = "tcp"

  source_security_group_id = "${aws_security_group.app_sg.id}"
  security_group_id        = "${var.paywlt_vpce_sg_id}"
}

resource "aws_security_group_rule" "allow_egress_from_mchcnsr_app_to_paywlt_vpce" {
  type      = "egress"
  from_port = "${local.nlb_port}"
  to_port   = "${local.nlb_port}"
  protocol  = "tcp"

  security_group_id        = "${aws_security_group.app_sg.id}"
  source_security_group_id = "${var.paywlt_vpce_sg_id}"
}

resource "aws_security_group_rule" "allow_ingress_from_mchcnsr_app_to_acdsr_vpce" {
  type      = "ingress"
  from_port = "${local.nlb_port}"
  to_port   = "${local.nlb_port}"
  protocol  = "tcp"

  source_security_group_id = "${aws_security_group.app_sg.id}"
  security_group_id        = "${var.acdsr_vpce_sg_id}"
}

resource "aws_security_group_rule" "allow_egress_from_mchcnsr_app_to_acdsr_vpce" {
  type      = "egress"
  from_port = "${local.nlb_port}"
  to_port   = "${local.nlb_port}"
  protocol  = "tcp"

  security_group_id        = "${aws_security_group.app_sg.id}"
  source_security_group_id = "${var.acdsr_vpce_sg_id}"
}

resource "aws_security_group_rule" "allow_ingress_from_mchcnsr_app_to_cntp13n_vpce" {
  type      = "ingress"
  from_port = "${local.nlb_port}"
  to_port   = "${local.nlb_port}"
  protocol  = "tcp"

  source_security_group_id = "${aws_security_group.app_sg.id}"
  security_group_id        = "${var.cntp13n_vpce_sg_id}"
}

resource "aws_security_group_rule" "allow_egress_from_mchcnsr_app_to_cntp13n_vpce" {
  type      = "egress"
  from_port = "${local.nlb_port}"
  to_port   = "${local.nlb_port}"
  protocol  = "tcp"

  security_group_id        = "${aws_security_group.app_sg.id}"
  source_security_group_id = "${var.cntp13n_vpce_sg_id}"
}

resource "aws_security_group_rule" "allow_ingress_from_mchcnsr_app_to_cnmsrch_vpce" {
  type      = "ingress"
  from_port = "${local.nlb_port}"
  to_port   = "${local.nlb_port}"
  protocol  = "tcp"

  source_security_group_id = "${aws_security_group.app_sg.id}"
  security_group_id        = "${var.cnmsrch_vpce_sg_id}"
}

resource "aws_security_group_rule" "allow_egress_from_mchcnsr_app_to_cnmsrch_vpce" {
  type      = "egress"
  from_port = "${local.nlb_port}"
  to_port   = "${local.nlb_port}"
  protocol  = "tcp"

  security_group_id        = "${aws_security_group.app_sg.id}"
  source_security_group_id = "${var.cnmsrch_vpce_sg_id}"
}

resource "aws_security_group_rule" "allow_ingress_from_mchcnsr_app_to_trpiapi_vpce" {
  type      = "ingress"
  from_port = "${local.nlb_port}"
  to_port   = "${local.nlb_port}"
  protocol  = "tcp"

  source_security_group_id = "${aws_security_group.app_sg.id}"
  security_group_id        = "${var.trpiapi_vpce_sg_id}"
}

resource "aws_security_group_rule" "allow_egress_from_mchcnsr_app_to_trpiapi_vpce" {
  type      = "egress"
  from_port = "${local.nlb_port}"
  to_port   = "${local.nlb_port}"
  protocol  = "tcp"

  security_group_id        = "${aws_security_group.app_sg.id}"
  source_security_group_id = "${var.trpiapi_vpce_sg_id}"
}

resource "aws_security_group_rule" "allow_ingress_from_mchcnsr_app_to_usracid_vpce" {
  type      = "ingress"
  from_port = "${local.nlb_port}"
  to_port   = "${local.nlb_port}"
  protocol  = "tcp"

  source_security_group_id = "${aws_security_group.app_sg.id}"
  security_group_id        = "${var.usracid_vpce_sg_id}"
}

resource "aws_security_group_rule" "allow_egress_from_mchcnsr_app_to_usracid_vpce" {
  type      = "egress"
  from_port = "${local.nlb_port}"
  to_port   = "${local.nlb_port}"
  protocol  = "tcp"

  security_group_id        = "${aws_security_group.app_sg.id}"
  source_security_group_id = "${var.usracid_vpce_sg_id}"
}

# resource "aws_security_group_rule" "allow_ingress_from_mchcnsr_app_to_ugcboo_vpce" {
#   type      = "ingress"
#   from_port = "${local.nlb_port}"
#   to_port   = "${local.nlb_port}"
#   protocol  = "tcp"

#   source_security_group_id = "${aws_security_group.app_sg.id}"
#   security_group_id        = "${var.ugcboo_vpce_sg_id}"
# }

# resource "aws_security_group_rule" "allow_egress_from_mchcnsr_app_to_ugcboo_vpce" {
#   type      = "egress"
#   from_port = "${local.nlb_port}"
#   to_port   = "${local.nlb_port}"
#   protocol  = "tcp"

#   security_group_id        = "${aws_security_group.app_sg.id}"
#   source_security_group_id = "${var.ugcboo_vpce_sg_id}"
# }

resource "aws_security_group_rule" "allow_ingress_from_mchcnsr_app_to_vcpint_vpce" {
  type      = "ingress"
  from_port = "${local.nlb_port}"
  to_port   = "${local.nlb_port}"
  protocol  = "tcp"

  source_security_group_id = "${aws_security_group.app_sg.id}"
  security_group_id        = "${var.vcpint_vpce_sg_id}"
}

resource "aws_security_group_rule" "allow_egress_from_mchcnsr_app_to_vcpint_vpce" {
  type      = "egress"
  from_port = "${local.nlb_port}"
  to_port   = "${local.nlb_port}"
  protocol  = "tcp"

  security_group_id        = "${aws_security_group.app_sg.id}"
  source_security_group_id = "${var.vcpint_vpce_sg_id}"
}

module "int_alb" {
  source = "github.com/traveloka/terraform-aws-alb-single-listener?ref=v0.2.2"

  service_name   = "${local.service_name}"
  environment    = "${var.environment}"
  product_domain = "${local.product_domain}"
  description    = "internal Application Load Balancer for ${local.product_domain} ${local.service_name} ${var.environment}"

  vpc_id        = "${var.vpc_id}"
  lb_subnet_ids = "${var.lb_subnet_ids}"

  lb_security_groups = [
    "${aws_security_group.lb_sg.id}",
  ]

  listener_certificate_arn = "${var.listener_certificate_arn}"
  lb_logs_s3_bucket_name   = "${var.lb_logs_s3_bucket_name}"
  cluster_role             = "${local.lb_cluster_role}"

  tg_port         = "${local.app_port}"
  tg_health_check = "${merge(local.lb_tg_health_check, var.lb_tg_health_check)}"
}

resource "aws_route53_record" "lb" {
  zone_id = "${var.route53_private_zone_id}"
  name    = "${local.lb_route53_record_name}.${data.aws_route53_zone.selected.name}"
  type    = "A"

  alias {
    name                   = "${lower(module.int_alb.lb_dns)}"
    zone_id                = "${module.int_alb.lb_zone_id}"
    evaluate_target_health = false
  }
}

#######
# APP #
#######

module "app_sg_name" {
  source        = "github.com/traveloka/terraform-aws-resource-naming?ref=v0.17.0"
  name_prefix   = "${local.app_cluster_name}"
  resource_type = "security_group"
}


resource "aws_security_group" "app_sg" {
  name        = "${module.app_sg_name.name}"
  description = "security group for ${local.app_cluster_name}"
  vpc_id      = "${var.vpc_id}"

  tags = {
    Name          = "${module.app_sg_name.name}"
    Service       = "${local.service_name}"
    ProductDomain = "${local.product_domain}"
    Environment   = "${var.environment}"
    Description   = "security group for ${local.app_cluster_name}"
    ManagedBy     = "terraform"
  }
}

resource "aws_security_group_rule" "allow_egress_from_mchcnsr_app_to_all_at_443" {
  type      = "egress"
  from_port = "${local.secure_port}"
  to_port   = "${local.secure_port}"
  protocol  = "tcp"

  cidr_blocks = [
    "0.0.0.0/0",
  ]

  security_group_id = "${aws_security_group.app_sg.id}"
}

########################
### Instance Profile ###
########################

module "instance_profile" {
  source         = "github.com/traveloka/terraform-aws-iam-role.git//modules/instance?ref=v1.0.2"
  service_name   = "${local.service_name}"
  cluster_role   = "${var.cluster_role}"
  environment    = "${var.environment}"
  product_domain = "${local.product_domain}"
}

####################
### IAM Policies ###
####################

resource "aws_iam_role_policy" "app_policy" {
  name   = "${local.service_name}-app-policy"
  role   = "${module.instance_profile.role_name}"
  policy = "${data.aws_iam_policy_document.app.json}"
}

resource "aws_iam_role_policy_attachment" "commonEC2" {
  role       = "${module.instance_profile.role_name}"
  policy_arn = "${var.commonEC2_policy_arn}"
}

resource "aws_iam_role_policy_attachment" "ssm_policy" {
  role       = "${module.instance_profile.role_name}"
  policy_arn = "${var.ssm_policy_arn}"
}


###########
### ASG ###
###########

module "asg" {
  source = "github.com/traveloka/terraform-aws-autoscaling?ref=v0.2.2"

  service_name   = "${local.service_name}"
  environment    = "${var.environment}"
  product_domain = "${local.product_domain}"
  description    = "autoscaling group for ${local.app_cluster_name}"
  application    = "${local.application}"

  security_groups = [
    "${aws_security_group.app_sg.id}",
  ]

  instance_profile = "${module.instance_profile.instance_profile_name}"

  image_owners = [
    "${var.image_owner}",
  ]

  image_filters = [
    {
      name = "image-id"

      values = [
        "${var.image_id}",
      ]
    },
  ]

  launch_template_overrides = [
    "${var.launch_template_overrides}",
  ]

  user_data = "${var.user_data}"

  asg_min_capacity = "${var.asg_min_capacity}"
  asg_max_capacity = "${var.asg_max_capacity}"

  asg_vpc_zone_identifier = [
    "${var.asg_vpc_zone_identifier}",
  ]

  asg_lb_target_group_arns = ["${module.int_alb.tg_arn}"]

  asg_health_check_type         = "${local.asg_health_check_type}"
  asg_wait_for_capacity_timeout = "${local.asg_wait_for_capacity_timeout}"

  asg_tags = [
    {
      key                 = "AmiId"
      value               = "${var.image_id}"
      propagate_at_launch = true
    },
  ]
}

idgen-seed
resource "aws_iam_role_policy" "idgen_seed_policy" {
 name       = "DynamoDbIdgenseedPolicy"
 role       = "${module.instance_profile.role_name}"
 policy     = "${data.aws_iam_policy_document.idgen_seed.json}"
}