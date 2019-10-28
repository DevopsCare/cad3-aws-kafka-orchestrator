module "kafka_label" {
  source      = "git::https://github.com/cloudposse/terraform-null-label.git?ref=tags/0.15.0"
  name        = local.cluster_name
  environment = local.environment_tag
  attributes  = ["kafka-node"]
  delimiter   = "-"

  label_order = ["name", "environment", "attributes"]

  tags = local.default_tags
}

module "zookeeper_label" {
  source      = "git::https://github.com/cloudposse/terraform-null-label.git?ref=tags/0.15.0"
  name        = local.cluster_name
  environment = local.environment_tag
  attributes  = ["zookeeper-node"]
  delimiter   = "-"

  label_order = ["name", "environment", "attributes"]

  tags = local.default_tags
}

module "resource_label" {
  source      = "git::https://github.com/cloudposse/terraform-null-label.git?ref=tags/0.15.0"
  name        = local.cluster_name
  environment = local.environment_tag
  attributes  = []
  delimiter   = "-"

  label_order = ["name", "environment"]

  tags = local.default_tags
}
