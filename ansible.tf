data "template_file" "inventory" {
  template = file("${path.module}/templates/inventory.tpl")
  vars = {
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
  }
}

resource "local_file" "inventory" {
    content     = data.template_file.inventory.rendered
    filename = "${path.module}/inventory"
}
