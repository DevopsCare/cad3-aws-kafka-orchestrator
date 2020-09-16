/*
* Copyright (c) 2020 Risk Focus Inc.
*
* Licensed under the Apache License, Version 2.0 (the "License");
* you may not use this file except in compliance with the License.
* You may obtain a copy of the License at
*
*     http://www.apache.org/licenses/LICENSE-2.0
*
* Unless required by applicable law or agreed to in writing, software
* distributed under the License is distributed on an "AS IS" BASIS,
* WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
* See the License for the specific language governing permissions and
* limitations under the License.
*/

resource "aws_route53_record" "kafka_az1" {
  count   = var.kafka_az1_count
  zone_id = var.route53_zone_id
  name    = "kafka-${count.index}a.${var.domain}"
  type    = "A"
  ttl     = "300"
  records = [element(module.kafka_nodes_az1.private_ip, count.index)]
}

resource "aws_route53_record" "kafka_az2" {
  count   = var.kafka_az2_count
  zone_id = var.route53_zone_id
  name    = "kafka-${count.index}b.${var.domain}"
  type    = "A"
  ttl     = "300"
  records = [element(module.kafka_nodes_az2.private_ip, count.index)]
}

resource "aws_route53_record" "kafka_az3" {
  count   = var.kafka_az3_count
  zone_id = var.route53_zone_id
  name    = "kafka-${count.index}c.${var.domain}"
  type    = "A"
  ttl     = "300"
  records = [element(module.kafka_nodes_az3.private_ip, count.index)]
}

resource "aws_route53_record" "kafka_round_robin" {
  zone_id = var.route53_zone_id
  name    = "kafka.${var.domain}"
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
  name    = "zookeeper-${count.index}a.${var.domain}"
  type    = "A"
  ttl     = "300"
  records = [element(module.zookeeper_nodes_az1.private_ip, count.index)]
}

resource "aws_route53_record" "zookeeper_az2" {
  count   = var.zookeeper_az2_count
  zone_id = var.route53_zone_id
  name    = "zookeeper-${count.index}b.${var.domain}"
  type    = "A"
  ttl     = "300"
  records = [element(module.zookeeper_nodes_az2.private_ip, count.index)]
}

resource "aws_route53_record" "zookeeper_az3" {
  count   = var.zookeeper_az3_count
  zone_id = var.route53_zone_id
  name    = "zookeeper-${count.index}c.${var.domain}"
  type    = "A"
  ttl     = "300"
  records = [element(module.zookeeper_nodes_az3.private_ip, count.index)]
}

resource "aws_route53_record" "zookeeper_round_robin" {
  zone_id = var.route53_zone_id
  name    = "zookeeper.${var.domain}"
  type    = "A"
  ttl     = "300"
  records = concat(
    module.zookeeper_nodes_az1.private_ip,
    module.zookeeper_nodes_az2.private_ip,
    module.zookeeper_nodes_az3.private_ip
  )
}
