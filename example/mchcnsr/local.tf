locals {
  vpc_id                   = "vpc-eaf6088e"
  environment              = "development"
  lb_subnet_ids            = ["subnet-7e627f09", "subnet-b1e90dd5", "subnet-cf758e96"]
  listener_certificate_arn = "arn:aws:acm:ap-southeast-1:123456789321:certificate/b2662111-8123-9b24-c3ae-f872633a21d3"
  lb_logs_s3_bucket_name   = "default-elb-logs-ap-southeast-1-123456789321"
  route53_private_zone_id  = "Z32OEBZ2VZHSJZ"
  cluster_role             = "app"
  commonEC2_policy_arn     = "arn:aws:iam::123456789321:policy/CommonEC2"
  ssm_policy_arn           = "arn:aws:iam::123456789321:policy/EC2PolicyToEnableSSM"
  image_owner              = "460124681500"

  receive_wait_time_seconds    = 1
  visibility_timeout_seconds   = 10 
  message_retention_seconds    = 28800 #8hrs
  tg_health_check = {
    interval            = 30
    path                = "/healthcheck"
    healthy_threshold   = 5
    unhealthy_threshold = 2
    timeout             = 5
    protocol            = "HTTP"
    matcher             = "200"
  }

  launch_template_overrides = [
    {
      "instance_type" = "c5.large"
    },
    {
      "instance_type" = "c4.large"
    },
  ]

  image_id         = "ami-0ee74cd429a4a5143"
  user_data        = ""
  asg_max_capacity = "3"
  asg_min_capacity = "0"

  asg_vpc_zone_identifier = [
    "subnet-7e627f09",
    "subnet-b1e90dd5",
    "subnet-cf758e96",
  ]

  redis_sg_id        = "sg-00d2de0d7fe7e2d3e"
  culsrch_vpce_sg_id = "sg-0fe8eca423757d97a"

  cntcms_vpce_sg_id = "sg-0fe8eca423757d97a"

  cntres_vpce_sg_id = "sg-0fe8eca423757d97a"

  xpesrch_vpce_sg_id = "sg-0fe8eca423757d97a"
  locgs_vpce_sg_id   = "sg-0fe8eca423757d97a"
  srssrch_vpce_sg_id = "sg-0fe8eca423757d97a"
  aprsr_vpce_sg_id   = "sg-0fe8eca423757d97a"

  recsys_vpce_sg_id = "sg-0fe8eca423757d97a"
  recqry_vpce_sg_id = "sg-0fe8eca423757d97a"
  ptswlt_vpce_sg_id = "sg-0fe8eca423757d97a"
  acdsr_vpce_sg_id  = "sg-0fe8eca423757d97a"

  paywlt_vpce_sg_id  = "sg-0fe8eca423757d97a"
  usracid_vpce_sg_id = "sg-0fe8eca423757d97a"
    ugcboo_vpce_sg_id = "sg-0fe8eca423757d97a"
  cntp13n_vpce_sg_id = "sg-0fe8eca423757d97a"
  cnmsrch_vpce_sg_id = "sg-0fe8eca423757d97a"
  trpiapi_vpce_sg_id = "sg-0fe8eca423757d97a"
  vcpint_vpce_sg_id = "sg-0fe8eca423757d97a"

  endpoint_service_allowed_principals = ["arn:aws:iam::722153654541:role/SuperAdmin"]

  mongo_sg_id = "sg-123456ye"

  fprinv_vpce_sg_id = "sg-0fe8eca423757d97a"

  mchitmd_lb_sg_id = "sg-4595d23c"

  mchcntr_lb_sg_id = "sg-4595d23c"

  mchdata_lb_sg_id = "sg-4595d23c"

  mchitmp_lb_sg_id = "sg-4595d23c"
}
