# module "ironbar" {
#   source         = "./modules/experiment"
#   name           = "ironbar-2022-10-04"
#   request_rate   = 10
#   request_source = "sqs"

#   ecs_cluster_id                                 = module.ecs-asg.cluster_id
#   efs_file_system_id                             = aws_efs_file_system.thunderdome.id
#   vpc_subnets                                    = module.vpc.public_subnets
#   dealgood_security_groups                       = [aws_security_group.dealgood.id]
#   execution_role_arn                             = aws_iam_role.ecsTaskExecutionRole.arn
#   dealgood_task_role_arn                         = aws_iam_role.dealgood.arn
#   log_group_name                                 = aws_cloudwatch_log_group.logs.name
#   aws_service_discovery_private_dns_namespace_id = aws_service_discovery_private_dns_namespace.main.id
#   ssm_exec_policy_arn                            = aws_iam_policy.ssm-exec.arn
#   grafana_agent_dealgood_config_url              = "http://${module.s3_bucket_public.s3_bucket_bucket_domain_name}/${module.grafana_agent_config["dealgood"].s3_object_id}"
#   grafana_agent_target_config_url                = "http://${module.s3_bucket_public.s3_bucket_bucket_domain_name}/${module.grafana_agent_config["target"].s3_object_id}"
#   request_sns_topic_arn                          = aws_sns_topic.gateway_requests.arn

#   grafana_secrets = [
#     { name = "GRAFANA_USER", valueFrom = "${data.aws_secretsmanager_secret.grafana-push-secret.arn}:username::" },
#     { name = "GRAFANA_PASS", valueFrom = "${data.aws_secretsmanager_secret.grafana-push-secret.arn}:password::" }
#   ]

#   dealgood_secrets = [
#     { name = "DEALGOOD_LOKI_USERNAME", valueFrom = "${data.aws_secretsmanager_secret.dealgood-loki-secret.arn}:username::" },
#     { name = "DEALGOOD_LOKI_PASSWORD", valueFrom = "${data.aws_secretsmanager_secret.dealgood-loki-secret.arn}:password::" },
#   ]

#   shared_env = [
#     { name = "IPFS_PROFILE", value = "server" },
#   ]

#   targets = {
#     "ironbar-kubo-head" = {
#       image       = "147263665150.dkr.ecr.eu-west-1.amazonaws.com/thunderdome:ironbar-kubo-head2"
#       environment = []
#     },
#     "ironbar-kubo-highlowwater" = {
#       image       = "147263665150.dkr.ecr.eu-west-1.amazonaws.com/thunderdome:ironbar-kubo-highlowwater"
#       environment = [
#         { name = "CONNMGR_HIGHWATER", value = "600" },
#         { name = "CONNMGR_LOWWATER", value = "300" },
#       ]
#     },
#   }
# }
