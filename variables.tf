variable "vpc_id" {
  type        = "string"
  description = "VPC Id to use for ASG security group as well as finding Service Tier subnets."
}

variable "environment" {
  type        = "string"
  description = "Environment name for which sns topic is created. Used in tagging."
}

variable "ssm_policy_arn" {
  type        = "string"
  description = "SSM access policy arn to attach to instance profile of asg."
}

variable "lb_logs_s3_bucket_name" {
  type        = "string"
  description = "The s3 bucket where the LB access logs will be stored"
}

variable "lb_tg_health_check" {
  type        = "map"
  default     = {}
  description = "The ALB target group's health check configuration, will be merged over the default on locals.tf"
}

variable "image_id" {
  type        = "string"
  description = "The AMI ID to spawn ASG instances from"
}

variable "image_owner" {
  type        = "string"
  description = "The owner of the AMI ID"
}

variable "launch_template_overrides" {
  type        = "list"
  description = "The list of launch template overrides"
}

variable "user_data" {
  type        = "string"
  description = "The user data to be passed to the launch template"
}

variable "asg_min_capacity" {
  type        = "string"
  description = "Minimum ASG capacity"
}

variable "asg_max_capacity" {
  type        = "string"
  description = "Maximum ASG capacity"
}

variable "asg_vpc_zone_identifier" {
  type        = "list"
  description = "The list of subnet ids to spawn ASG instances to"
}

variable "lb_route53_record_name" {
  type        = "string"
  description = "The name of Route 53 record pointing to the LB. The default is the service name"
  default     = ""
}

variable "cluster_role" {
  type        = "string"
  description = "cluster role for asg"
}

variable "commonEC2_policy_arn" {
  type        = "string"
  description = "Common EC2 Policy ARN"
}

variable "lb_subnet_ids" {
  type        = "list"
  description = "The list of public subnet ids to attach to the LB internal"
}

variable "listener_certificate_arn" {
  type        = "string"
  description = "The ARN of the default SSL server certificate "
}

variable "route53_private_zone_id" {
  type        = "string"
  description = "The ID of Route 53 private zone"
}

variable "locgs_vpce_sg_id" {
  type        = "string"
  description = "The ID of locgs_vpce security group"
}

variable "srssrch_vpce_sg_id" {
  type        = "string"
  description = "The ID of srssrch_vpce security group"
}

variable "cntres_vpce_sg_id" {
  type        = "string"
  description = "The ID of cntres_vpce security group"
}

variable "cntcms_vpce_sg_id" {
  type        = "string"
  description = "The ID of cntcms_vpce security group"
}

variable "fprinv_vpce_sg_id" {
  type        = "string"
  description = "The ID of fprinv_vpce security group"
}

variable "culsrch_vpce_sg_id" {
  type        = "string"
  description = "The ID of culsrch_vpce security group"
}

variable "xpesrch_vpce_sg_id" {
  type        = "string"
  description = "The ID of xpesrch_vpce security group"
}

variable "recqry_vpce_sg_id" {
  type        = "string"
  description = "The ID of recqry_vpce security group"
}

variable "recsys_vpce_sg_id" {
  type        = "string"
  description = "The ID of recsys_vpce security group"
}

variable "paywlt_vpce_sg_id" {
  type        = "string"
  description = "The ID of paywlt_vpce security group"
}

variable "ptswlt_vpce_sg_id" {
  type        = "string"
  description = "The ID of ptswlt_vpce security group"
}

variable "usracid_vpce_sg_id" {
  type        = "string"
  description = "The ID of usracid_vpce security group"
}

variable "cntp13n_vpce_sg_id" {
  type        = "string"
  description = "The ID of cntp13n_vpce security group"
}

variable "cnmsrch_vpce_sg_id" {
  type        = "string"
  description = "The ID of cnmsrch_vpce security group"
}

# variable "ugcboo_vpce_sg_id" {
#   type        = "string"
#   description = "The ID of ugcboo_vpce security group"
# }

variable "trpiapi_vpce_sg_id" {
  type        = "string"
  description = "The ID of trpiapi_vpce security group"
}

variable "acdsr_vpce_sg_id" {
  type        = "string"
  description = "The ID of acdsr_vpce security group"
}

variable "vcpint_vpce_sg_id" {
  type        = "string"
  description = "The ID of vcpint_vpce security group"
}


variable "mchdata_mongo_sg_id" {
  type        = "string"
  description = "Mchjob Mongo security group id"
}

variable "mchjob_redis_sg_id" {
  type        = "string"
  description = "mchjob Redis security group id"
}

variable "mchdata_lb_sg_id" {
  type        = "string"
  description = "mchdata lb security group id"
}

variable "mchitmp_lb_sg_id" {
  type        = "string"
  description = "mchitmp lb security group id"
}

variable "mchcntr_lb_sg_id" {
  type        = "string"
  description = "mchcntr lb security group id"
}

variable "mchitmd_lb_sg_id" {
  type        = "string"
  description = "mchitmd lb security group id"
}

variable "receive_wait_time_seconds" {
  type        = "string"
  description = "sqs queues wait time seconds"  
}
variable "visibility_timeout_seconds" {
  type        = "string"
  description = "sqs queues visibility timeout seconds"
}
variable "message_retention_seconds" {
  type        = "string"
  description = "sqs queues message retention seconds"
}


variable "idgen_seed_arn" {
  type        = "string"
  description = "The ARN for idgen-seed DynamoDB"
}