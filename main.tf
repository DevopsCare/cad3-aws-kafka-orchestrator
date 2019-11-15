data "aws_subnet" "az1" {
  count = var.kafka_az1_count > 0 ? 1 : 0
  id = var.az1_subnet_id
}

data "aws_subnet" "az2" {
  count = var.kafka_az2_count > 0 ? 1 : 0
  id = var.az2_subnet_id
}

data "aws_subnet" "az3" {
  count = var.kafka_az3_count > 0 ? 1 : 0
  id = var.az3_subnet_id
}
