module "kafka_label" {
  source      = "git::https://github.com/cloudposse/terraform-null-label.git?ref=tags/0.16.0"
  context     = var.label.context
  name        = "kafka"
}
module "zookeeper_label" {
  source      = "git::https://github.com/cloudposse/terraform-null-label.git?ref=tags/0.16.0"
  context     = var.label.context
  name        = "zookeeper"
}
