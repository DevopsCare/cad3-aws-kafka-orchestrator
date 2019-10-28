module "zookeeper_nodes_az1" {
  source  = "./terraform-aws-ec2-instance"

  name                        = "zookeeper_nodes_az1"
  instance_count              = var.zookeeper_az1_count
  ami                         = data.aws_ami.ami.id
  instance_type               = var.zookeeper_instance_type
  associate_public_ip_address = false
  subnet_id                   = var.az1_subnet_id
  vpc_security_group_ids      = concat([aws_security_group.zookeeper_cluster.id], var.zookeeper_additional_security_groups)
  key_name                    = var.ec2_key_pair_name

  instance_initiated_shutdown_behavior = "terminate"

  iam_instance_profile = var.zookeeper_instance_profile

  tags = module.zookeeper_label.tags

  root_block_device = var.zookeeper_root_block_device

  ebs_block_device = var.zookeeper_ebs_block_device

  user_data = join("\n", list(var.zookeeper_user_data, var.zookeeper_user_data_extra))
}

module "zookeeper_nodes_az2" {
  source  = "./terraform-aws-ec2-instance"

  name                        = "zookeeper_nodes_az2"
  instance_count              = var.zookeeper_az2_count
  ami                         = data.aws_ami.ami.id
  instance_type               = var.zookeeper_instance_type
  associate_public_ip_address = false
  subnet_id                   = var.az2_subnet_id
  vpc_security_group_ids      = concat([aws_security_group.zookeeper_cluster.id], var.zookeeper_additional_security_groups)
  key_name                    = var.ec2_key_pair_name

  instance_initiated_shutdown_behavior = "terminate"

  iam_instance_profile = var.zookeeper_instance_profile

  tags = module.zookeeper_label.tags

  root_block_device = var.zookeeper_root_block_device

  ebs_block_device = var.zookeeper_ebs_block_device

  user_data = join("\n", list(var.zookeeper_user_data, var.zookeeper_user_data_extra))
}

module "zookeeper_nodes_az3" {
  source  = "./terraform-aws-ec2-instance"

  name                        = "zookeeper_nodes_az3"
  instance_count              = var.zookeeper_az3_count
  ami                         = data.aws_ami.ami.id
  instance_type               = var.zookeeper_instance_type
  associate_public_ip_address = false
  subnet_id                   = var.az3_subnet_id
  vpc_security_group_ids      = concat([aws_security_group.zookeeper_cluster.id], var.zookeeper_additional_security_groups)
  key_name                    = var.ec2_key_pair_name

  instance_initiated_shutdown_behavior = "terminate"

  iam_instance_profile = var.zookeeper_instance_profile

  tags = module.zookeeper_label.tags

  root_block_device = var.zookeeper_root_block_device

  ebs_block_device = var.zookeeper_ebs_block_device

  user_data = join("\n", list(var.zookeeper_user_data, var.zookeeper_user_data_extra))
}
