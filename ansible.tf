data "template_file" "inventory" {
  template = file("${path.module}/templates/inventory.tpl")
  vars = {
    list_kafka_nodes_az1 = join(
      "\n",
      formatlist(
        "%s ip=%s az=%s",
        module.kafka_nodes_az1.private_dns,
        module.kafka_nodes_az1.private_ip,
        module.kafka_nodes_az1.availability_zone,
      ),
    )
    list_kafka_nodes_az2 = join(
      "\n",
      formatlist(
        "%s ip=%s az=%s",
        module.kafka_nodes_az2.private_dns,
        module.kafka_nodes_az2.private_ip,
        module.kafka_nodes_az2.availability_zone,
      ),
    )
    list_kafka_nodes_az3 = join(
      "\n",
      formatlist(
        "%s ip=%s az=%s",
        module.kafka_nodes_az3.private_dns,
        module.kafka_nodes_az3.private_ip,
        module.kafka_nodes_az3.availability_zone,
      ),
    )
    list_zookeeper_nodes_az1 = join(
      "\n",
      formatlist(
        "%s ip=%s",
        module.zookeeper_nodes_az1.private_dns,
        module.zookeeper_nodes_az1.private_ip,
      ),
    )
    list_zookeeper_nodes_az2 = join(
      "\n",
      formatlist(
        "%s ip=%s",
        module.zookeeper_nodes_az2.private_dns,
        module.zookeeper_nodes_az2.private_ip,
      ),
    )
    list_zookeeper_nodes_az3 = join(
      "\n",
      formatlist(
        "%s ip=%s",
        module.zookeeper_nodes_az3.private_dns,
        module.zookeeper_nodes_az3.private_ip,
      ),
    )
  }
}

resource "local_file" "inventory" {
    content     = data.template_file.inventory.rendered
    filename = "${path.module}/inventory"
}
