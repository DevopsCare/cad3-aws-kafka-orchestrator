
/*
*Copyright (c) 2020 Risk Focus Inc.
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
