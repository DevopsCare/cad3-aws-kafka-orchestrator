locals {
  environment_name = var.environment_name == "" ? "dev" : var.environment_name
  cluster_name     = var.cluster_name == "" ? "rf-kafka" : var.cluster_name
  root_domain      = var.root_domain == "" ? "riksfocus.com" : var.root_domain

  domain          = "${local.cluster_name}.${local.environment_name}.${local.root_domain}"
  environment_tag = "${local.cluster_name}-${local.environment_name}"

  default_tags = merge(
    {
      ManagedBy    = "Terraform"
      KafkaCluster = local.cluster_name
      Schedule     = var.scheduler_name
    },
    var.additional_tags
  )
}

resource "aws_security_group" "kafka_cluster" {
  name_prefix = "kafka_cluster_${local.cluster_name}"
  description = "Kafka - ${local.cluster_name}"
  vpc_id      = var.vpc_id
  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = var.ip_whitelist
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_security_group" "zookeeper_cluster" {
  name_prefix = "kafka_cluster_${local.cluster_name}"
  description = "Zookeeper - ${local.cluster_name}"
  vpc_id      = var.vpc_id
  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = var.ip_whitelist
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
