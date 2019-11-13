locals {
  inventory_enabled = length(var.ansible_inventory_file_location) > 0 ?  1 : 0
}

resource "local_file" "inventory" {
  count = local.inventory_enabled
  content  = templatefile("${path.module}/templates/inventory.tpl", {
    list_kafka_nodes_az1 = join(
      "\n",
      formatlist(
        "%s aws_ec2_id=%s az=%s",
        module.kafka_nodes_az1.private_ip,
        module.kafka_nodes_az1.id,
        module.kafka_nodes_az1.availability_zone,
      ),
    )
    list_kafka_nodes_az2 = join(
      "\n",
      formatlist(
        "%s aws_ec2_id=%s az=%s",
        module.kafka_nodes_az2.private_ip,
        module.kafka_nodes_az2.id,
        module.kafka_nodes_az2.availability_zone,
      ),
    )
    list_kafka_nodes_az3 = join(
      "\n",
      formatlist(
        "%s aws_ec2_id=%s az=%s",
        module.kafka_nodes_az3.private_ip,
        module.kafka_nodes_az3.id,
        module.kafka_nodes_az3.availability_zone,
      ),
    )
    list_zookeeper_nodes_az1 = join(
      "\n",
      formatlist(
        "%s aws_ec2_id=%s",
        module.zookeeper_nodes_az1.private_ip,
        module.zookeeper_nodes_az1.id,
      ),
    )
    list_zookeeper_nodes_az2 = join(
      "\n",
      formatlist(
        "%s aws_ec2_id=%s",
        module.zookeeper_nodes_az2.private_ip,
        module.zookeeper_nodes_az2.id,
      ),
    )
    list_zookeeper_nodes_az3 = join(
      "\n",
      formatlist(
        "%s aws_ec2_id=%s",
        module.zookeeper_nodes_az3.private_ip,
        module.zookeeper_nodes_az3.id,
      ),
    )
  })
  filename = var.ansible_inventory_file_location
}
