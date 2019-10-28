module "kafka_nodes_az1" {
  source  = "./terraform-aws-ec2-instance"

  name                        = "kafka_nodes_az1"
  instance_count              = var.kafka_az1_count
  ami                         = data.aws_ami.ami.id
  instance_type               = var.kafka_instance_type
  associate_public_ip_address = false
  subnet_id                   = var.az1_subnet_id
  vpc_security_group_ids      = concat([aws_security_group.kafka_cluster.id], var.kafka_additional_security_groups)
  key_name                    = var.ec2_key_pair_name

  instance_initiated_shutdown_behavior = "terminate"

  iam_instance_profile = var.kafka_instance_profile

  tags = module.kafka_label.tags

  root_block_device = var.kafka_root_block_device

  ebs_block_device = var.kafka_ebs_block_device

  user_data = join("\n", list(var.kafka_user_data, var.kafka_user_data_extra))
}

module "kafka_nodes_az2" {
  source  = "./terraform-aws-ec2-instance"

  name                        = "kafka_nodes_az2"
  instance_count              = var.kafka_az2_count
  ami                         = data.aws_ami.ami.id
  instance_type               = var.kafka_instance_type
  associate_public_ip_address = false
  subnet_id                   = var.az2_subnet_id
  vpc_security_group_ids      = concat([aws_security_group.kafka_cluster.id], var.kafka_additional_security_groups)
  key_name                    = var.ec2_key_pair_name

  instance_initiated_shutdown_behavior = "terminate"

  iam_instance_profile = var.kafka_instance_profile

  tags = module.kafka_label.tags

  root_block_device = var.kafka_root_block_device

  ebs_block_device = var.kafka_ebs_block_device

  user_data = join("\n", list(var.kafka_user_data, var.kafka_user_data_extra))
}

module "kafka_nodes_az3" {
  source  = "./terraform-aws-ec2-instance"

  name                        = "kafka_nodes_az3"
  instance_count              = var.kafka_az3_count
  ami                         = data.aws_ami.ami.id
  instance_type               = var.kafka_instance_type
  associate_public_ip_address = false
  subnet_id                   = var.az3_subnet_id
  vpc_security_group_ids      = concat([aws_security_group.kafka_cluster.id], var.kafka_additional_security_groups)
  key_name                    = var.ec2_key_pair_name

  instance_initiated_shutdown_behavior = "terminate"

  iam_instance_profile = var.kafka_instance_profile

  tags = module.kafka_label.tags

  root_block_device = var.kafka_root_block_device

  ebs_block_device = var.kafka_ebs_block_device

  user_data = join("\n", list(var.kafka_user_data, var.kafka_user_data_extra))
}
