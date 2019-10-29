output "kafka_instances" {
  value = merge(

    { for idx in range(var.kafka_az1_count):
       aws_route53_record.kafka_az1[idx].name => {
         private_ip = module.kafka_nodes_az1.private_ip[idx]
         az         = module.kafka_nodes_az1.availability_zone[idx]
         id         = module.kafka_nodes_az1.id[idx]
       }
    },
    { for idx in range(var.kafka_az2_count):
       aws_route53_record.kafka_az2[idx].name => {
         private_ip = module.kafka_nodes_az2.private_ip[idx]
         az         = module.kafka_nodes_az2.availability_zone[idx]
         id         = module.kafka_nodes_az2.id[idx]
       }
    },
    { for idx in range(var.kafka_az3_count):
       aws_route53_record.kafka_az3[idx].name => {
         private_ip = module.kafka_nodes_az3.private_ip[idx]
         az         = module.kafka_nodes_az3.availability_zone[idx]
         id         = module.kafka_nodes_az3.id[idx]
       }
    }
  )

}

output "kafka_bootstrap_servers" {
  value = aws_route53_record.kafka_round_robin.name
}

output "zookeeper_instances" {
  value = merge(

    { for idx in range(var.zookeeper_az1_count):
       aws_route53_record.zookeeper_az1[idx].name => {
         private_ip = module.zookeeper_nodes_az1.private_ip[idx]
         az         = module.zookeeper_nodes_az1.availability_zone[idx]
         id         = module.zookeeper_nodes_az1.id[idx]
       }
    },
    { for idx in range(var.zookeeper_az2_count):
       aws_route53_record.zookeeper_az2[idx].name => {
         private_ip = module.zookeeper_nodes_az2.private_ip[idx]
         az         = module.zookeeper_nodes_az2.availability_zone[idx]
         id         = module.zookeeper_nodes_az2.id[idx]
       }
    },
    { for idx in range(var.zookeeper_az3_count):
       aws_route53_record.zookeeper_az3[idx].name => {
         private_ip = module.zookeeper_nodes_az3.private_ip[idx]
         az         = module.zookeeper_nodes_az3.availability_zone[idx]
         id         = module.zookeeper_nodes_az3.id[idx]
       }
    }
  )

}

output "zookeeper_bootstrap_servers" {
  value = aws_route53_record.zookeeper_round_robin.name
}
