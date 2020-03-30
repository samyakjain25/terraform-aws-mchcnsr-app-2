locals {
  application        = "java-8"
  service_name       = "mchcnsr"
  product_domain     = "mch"
  lb_cluster_role    = "lbint"
  lbint_cluster_name = "${local.service_name}-${local.lb_cluster_role}"

  lb_route53_record_name = "${var.lb_route53_record_name == "" ? local.service_name : var.lb_route53_record_name}"

  lb_tg_health_check = {
    port = "${local.app_port}"
  }

  app_cluster_role = "app"
  app_cluster_name = "${local.service_name}-${local.app_cluster_role}"
  app_port         = 65000

  asg_health_check_type         = "ELB"
  asg_wait_for_capacity_timeout = "7m"
  asg_policy_cpu_target_value   = 60.0

  secure_port = 443
  nlb_port    = 80
  mongo_port  = 27017
  redis_port  = 6379
}
