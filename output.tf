
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


output "kafka_instances" {
  value = merge(
    { for idx in range(length(module.kafka_nodes_az1.id)):
       element(aws_route53_record.kafka_az1, idx)["name"] => {
         private_ip      = element(module.kafka_nodes_az1.private_ip, idx)
         az              = element(module.kafka_nodes_az1.availability_zone, idx)
         aws_instance_id = element(module.kafka_nodes_az1.id, idx)
       }
    },
    { for idx in range(length(module.kafka_nodes_az2.id)):
       element(aws_route53_record.kafka_az2, idx)["name"] => {
         private_ip      = element(module.kafka_nodes_az2.private_ip, idx)
         az              = element(module.kafka_nodes_az2.availability_zone, idx)
         aws_instance_id = element(module.kafka_nodes_az2.id, idx)
       }
    },
    { for idx in range(length(module.kafka_nodes_az3.id)):
       element(aws_route53_record.kafka_az3, idx)["name"] => {
         private_ip      = element(module.kafka_nodes_az3.private_ip, idx)
         az              = element(module.kafka_nodes_az3.availability_zone, idx)
         aws_instance_id = element(module.kafka_nodes_az3.id, idx)
       }
    }
  )
}

output "kafka_bootstrap_servers" {
  value = aws_route53_record.kafka_round_robin.name
}

output "zookeeper_instances" {
  value = merge(
    { for idx in range(length(module.zookeeper_nodes_az1.id)):
       element(aws_route53_record.zookeeper_az1, idx)["name"] => {
         private_ip      = element(module.zookeeper_nodes_az1.private_ip, idx)
         az              = element(module.zookeeper_nodes_az1.availability_zone, idx)
         aws_instance_id = element(module.zookeeper_nodes_az1.id, idx)
       }
    },
    { for idx in range(length(module.zookeeper_nodes_az2.id)):
       element(aws_route53_record.zookeeper_az2, idx)["name"] => {
         private_ip      = element(module.zookeeper_nodes_az2.private_ip, idx)
         az              = element(module.zookeeper_nodes_az2.availability_zone, idx)
         aws_instance_id = element(module.zookeeper_nodes_az2.id, idx)
       }
    },
    { for idx in range(length(module.zookeeper_nodes_az3.id)):
       element(aws_route53_record.zookeeper_az3, idx)["name"] => {
         private_ip      = element(module.zookeeper_nodes_az3.private_ip, idx)
         az              = element(module.zookeeper_nodes_az3.availability_zone, idx)
         aws_instance_id = element(module.zookeeper_nodes_az3.id, idx)
       }
    }
  )
}

output "zookeeper_bootstrap_servers" {
  value = aws_route53_record.zookeeper_round_robin.name
}

