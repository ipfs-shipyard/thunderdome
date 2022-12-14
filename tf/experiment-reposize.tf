# module "reposize" {
#   source = "./modules/experiment"
#   name   = "reposize-2022-09-08"
#   request_rate = 10

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

#   dealgood_environment = [
#     { name = "DEALGOOD_SOURCE", value = "loki" },
#     { name = "DEALGOOD_LOKI_URI", value = "https://logs-prod-us-central1.grafana.net" },
#     { name = "DEALGOOD_LOKI_QUERY", value = "{job=\"nginx\",app=\"gateway\",team=\"bifrost\"}" },
#   ]

#   dealgood_secrets = [
#     { name = "DEALGOOD_LOKI_USERNAME", valueFrom = "${data.aws_secretsmanager_secret.dealgood-loki-secret.arn}:username::" },
#     { name = "DEALGOOD_LOKI_PASSWORD", valueFrom = "${data.aws_secretsmanager_secret.dealgood-loki-secret.arn}:password::" },
#   ]

#   shared_env = [
#     { name = "IPFS_PROFILE", value = "server" },
#   ]

#   targets = {
#     "005GB" = {
#       image = "147263665150.dkr.ecr.eu-west-1.amazonaws.com/thunderdome:kubo-v0.15.0-reposize"
#       environment = [
#         { name = "REPO_SIZE", value = "5GB" }
#       ]
#     }

#     "010GB" = {
#       image = "147263665150.dkr.ecr.eu-west-1.amazonaws.com/thunderdome:kubo-v0.15.0-reposize"
#       environment = [
#         { name = "REPO_SIZE", value = "10GB" }
#       ]
#     }

#     "025GB" = {
#       image = "147263665150.dkr.ecr.eu-west-1.amazonaws.com/thunderdome:kubo-v0.15.0-reposize"
#       environment = [
#         { name = "REPO_SIZE", value = "25GB" }
#       ]
#     }

#     "050GB" = {
#       image = "147263665150.dkr.ecr.eu-west-1.amazonaws.com/thunderdome:kubo-v0.15.0-reposize"
#       environment = [
#         { name = "REPO_SIZE", value = "50GB" }
#       ]
#     }

#     "075GB" = {
#       image = "147263665150.dkr.ecr.eu-west-1.amazonaws.com/thunderdome:kubo-v0.15.0-reposize"
#       environment = [
#         { name = "REPO_SIZE", value = "75GB" }
#       ]
#     }

#     "100GB" = {
#       image = "147263665150.dkr.ecr.eu-west-1.amazonaws.com/thunderdome:kubo-v0.15.0-reposize"
#       environment = [
#         { name = "REPO_SIZE", value = "100GB" }
#       ]
#     },
#   }
# }
