module "kafka_label" {
  source      = "git::https://github.com/cloudposse/terraform-null-label.git?ref=tags/0.15.0"
  context     = var.label.context
  name        = "kafka-node"
}
module "zookeeper_label" {
  source      = "git::https://github.com/cloudposse/terraform-null-label.git?ref=tags/0.15.0"
  context     = var.label.context
  name        = "zookeeper-node"
}
