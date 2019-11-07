data "template_cloudinit_config" "kafka" {
  # Main cloud-config configuration file.
  part {
    filename     = "init.cfg"
    content_type = "text/cloud-config"
    content      = templatefile("${path.module}/templates/init.tpl", {
      volume_path = var.kafka_ebs_block_device[0].device_name
      fs_path     = "/kafka"
    })
  }

  part {
    content_type = "text/x-shellscript"
    content      = var.kafka_additional_user_data
  }
}

module "kafka_nodes_az1" {
  source         = "terraform-aws-modules/ec2-instance/aws"
  version        = "~> 2.0"
  instance_count = var.kafka_az1_count

  name          = "${module.kafka_label.id}-az1"
  ami           = var.ami_id
  instance_type = var.kafka_instance_type
  tags          = module.kafka_label.tags
  use_num_suffix  = true

  associate_public_ip_address = false
  subnet_id                   = var.az1_subnet_id
  vpc_security_group_ids      = concat([aws_security_group.kafka_cluster.id], var.kafka_additional_security_groups)

  key_name             = var.ec2_key_pair_name
  iam_instance_profile = var.kafka_instance_profile
  user_data            = data.template_cloudinit_config.kafka.rendered

  ebs_optimized     = true
  root_block_device = var.kafka_root_block_device
  ebs_block_device  = var.kafka_ebs_block_device
}

module "kafka_nodes_az2" {
  source         = "terraform-aws-modules/ec2-instance/aws"
  version        = "~> 2.0"
  instance_count = var.kafka_az2_count

  name          = "${module.kafka_label.id}-az2"
  ami           = var.ami_id
  instance_type = var.kafka_instance_type
  tags          = module.kafka_label.tags
  use_num_suffix  = true

  associate_public_ip_address = false
  subnet_id                   = var.az2_subnet_id
  vpc_security_group_ids      = concat([aws_security_group.kafka_cluster.id], var.kafka_additional_security_groups)

  key_name             = var.ec2_key_pair_name
  iam_instance_profile = var.kafka_instance_profile
  user_data            = data.template_cloudinit_config.kafka.rendered

  ebs_optimized     = true
  root_block_device = var.kafka_root_block_device
  ebs_block_device  = var.kafka_ebs_block_device
}

module "kafka_nodes_az3" {
  source         = "terraform-aws-modules/ec2-instance/aws"
  version        = "~> 2.0"
  instance_count = var.kafka_az3_count

  name          = "${module.kafka_label.id}-az3"
  ami           = var.ami_id
  instance_type = var.kafka_instance_type
  tags          = module.kafka_label.tags
  use_num_suffix  = true

  associate_public_ip_address = false
  subnet_id                   = var.az3_subnet_id
  vpc_security_group_ids      = concat([aws_security_group.kafka_cluster.id], var.kafka_additional_security_groups)

  key_name             = var.ec2_key_pair_name
  iam_instance_profile = var.kafka_instance_profile
  user_data            = data.template_cloudinit_config.kafka.rendered

  ebs_optimized     = true
  root_block_device = var.kafka_root_block_device
  ebs_block_device  = var.kafka_ebs_block_device
}
