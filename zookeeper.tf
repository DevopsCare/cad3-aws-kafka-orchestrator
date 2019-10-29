data "template_cloudinit_config" "zookeeper" {
  # Main cloud-config configuration file.
  part {
    filename     = "init.cfg"
    content_type = "text/cloud-config"
    content      = templatefile("${path.module}/templates/init.tpl", {
      volume_path = var.zookeeper_ebs_block_device[0].device_name
      fs_path     = "/zookeeper"
    })
  }

  part {
    content_type = "text/x-shellscript"
    content      = var.zookeeper_additional_user_data
  }
}

module "zookeeper_nodes_az1" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "~> 2.0"

  name                        = "${module.zookeeper_label.id}-az1"
  instance_count              = var.zookeeper_az1_count
  ami                         = var.ami_id
  instance_type               = var.zookeeper_instance_type
  associate_public_ip_address = false
  subnet_id                   = var.az1_subnet_id
  vpc_security_group_ids      = concat([aws_security_group.zookeeper_cluster.id], var.zookeeper_additional_security_groups)
  key_name                    = var.ec2_key_pair_name

  iam_instance_profile = var.zookeeper_instance_profile

  tags = module.zookeeper_label.tags

  root_block_device = var.zookeeper_root_block_device

  ebs_block_device = var.zookeeper_ebs_block_device

  user_data = data.template_cloudinit_config.zookeeper.rendered
}

module "zookeeper_nodes_az2" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "~> 2.0"

  name                        = "${module.zookeeper_label.id}-az2"
  instance_count              = var.zookeeper_az2_count
  ami                         = var.ami_id
  instance_type               = var.zookeeper_instance_type
  associate_public_ip_address = false
  subnet_id                   = var.az2_subnet_id
  vpc_security_group_ids      = concat([aws_security_group.zookeeper_cluster.id], var.zookeeper_additional_security_groups)
  key_name                    = var.ec2_key_pair_name

  iam_instance_profile = var.zookeeper_instance_profile

  tags = module.zookeeper_label.tags

  root_block_device = var.zookeeper_root_block_device

  ebs_block_device = var.zookeeper_ebs_block_device

  user_data = data.template_cloudinit_config.zookeeper.rendered
}

module "zookeeper_nodes_az3" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "~> 2.0"

  name                        = "${module.zookeeper_label.id}-az3"
  instance_count              = var.zookeeper_az3_count
  ami                         = var.ami_id
  instance_type               = var.zookeeper_instance_type
  associate_public_ip_address = false
  subnet_id                   = var.az3_subnet_id
  vpc_security_group_ids      = concat([aws_security_group.zookeeper_cluster.id], var.zookeeper_additional_security_groups)
  key_name                    = var.ec2_key_pair_name

  iam_instance_profile = var.zookeeper_instance_profile

  tags = module.zookeeper_label.tags

  root_block_device = var.zookeeper_root_block_device

  ebs_block_device = var.zookeeper_ebs_block_device

  user_data = data.template_cloudinit_config.zookeeper.rendered
}
