output "kafka_nodes" {
  value = {
    "az1" = aws_route53_record.kafka_az1[*].name
    "az2" = aws_route53_record.kafka_az2[*].name
    "az3" = aws_route53_record.kafka_az3[*].name
  }
}

output "kafka_ips" {
  value = {
    "az1" = module.kafka_nodes_az1.private_ip
    "az2" = module.kafka_nodes_az2.private_ip
    "az3" = module.kafka_nodes_az3.private_ip
  }
}

output "zookeeper_nodes" {
  value = {
    "az1" = aws_route53_record.zookeeper_az1[*].name
    "az2" = aws_route53_record.zookeeper_az2[*].name
    "az3" = aws_route53_record.zookeeper_az3[*].name
  }
}

output "zookeeper_ips" {
  value = {
    "az1" = module.zookeeper_nodes_az1.private_ip
    "az2" = module.zookeeper_nodes_az2.private_ip
    "az3" = module.zookeeper_nodes_az3.private_ip
  }
}

#output "finish_provision" {
#  value = random_id.provision.hex
#}
