resource "aws_route53_record" "kafka_az1" {
  count   = var.kafka_az1_count
  zone_id = var.route53_zone_id
  name    = "kafka-${count.index}a.${local.domain}"
  type    = "A"
  ttl     = "300"
  records = ["${element(module.kafka_nodes_az1.private_ip, count.index)}"]
}

resource "aws_route53_record" "kafka_az2" {
  count   = var.kafka_az2_count
  zone_id = var.route53_zone_id
  name    = "kafka-${count.index}b.${local.domain}"
  type    = "A"
  ttl     = "300"
  records = ["${element(module.kafka_nodes_az2.private_ip, count.index)}"]
}

resource "aws_route53_record" "kafka_az3" {
  count   = var.kafka_az3_count
  zone_id = var.route53_zone_id
  name    = "kafka-${count.index}c.${local.domain}"
  type    = "A"
  ttl     = "300"
  records = ["${element(module.kafka_nodes_az3.private_ip, count.index)}"]
}

resource "aws_route53_record" "kafka_round_robin" {
  count   = 1
  zone_id = var.route53_zone_id
  name    = "kafka.${local.domain}"
  type    = "A"
  ttl     = "300"
  records = concat(
    module.kafka_nodes_az1.private_ip,
    module.kafka_nodes_az2.private_ip,
    module.kafka_nodes_az3.private_ip
  )
}

resource "aws_route53_record" "zookeeper_az1" {
  count   = var.zookeeper_az1_count
  zone_id = var.route53_zone_id
  name    = "zookeeper-${count.index}a.${local.domain}"
  type    = "A"
  ttl     = "300"
  records = ["${element(module.zookeeper_nodes_az1.private_ip, count.index)}"]
}

resource "aws_route53_record" "zookeeper_az2" {
  count   = var.zookeeper_az2_count
  zone_id = var.route53_zone_id
  name    = "zookeeper-${count.index}b.${local.domain}"
  type    = "A"
  ttl     = "300"
  records = ["${element(module.zookeeper_nodes_az2.private_ip, count.index)}"]
}

resource "aws_route53_record" "zookeeper_az3" {
  count   = var.zookeeper_az3_count
  zone_id = var.route53_zone_id
  name    = "zookeeper-${count.index}c.${local.domain}"
  type    = "A"
  ttl     = "300"
  records = ["${element(module.zookeeper_nodes_az3.private_ip, count.index)}"]
}

resource "aws_route53_record" "zookeeper_round_robin" {
  count   = 1
  zone_id = var.route53_zone_id
  name    = "zookeeper.${local.domain}"
  type    = "A"
  ttl     = "300"
  records = concat(
    module.zookeeper_nodes_az1.private_ip,
    module.zookeeper_nodes_az2.private_ip,
    module.zookeeper_nodes_az3.private_ip
  )
}
