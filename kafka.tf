/*
* Copyright (c) 2020 Risk Focus Inc.
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

data "template_cloudinit_config" "kafka" {
  # Main cloud-config configuration file.
  part {
    filename     = "init.cfg"
    content_type = "text/cloud-config"
    content = templatefile("${path.module}/templates/init.tpl", {
      volume_path = var.kafka_ebs_optimized ? var.kafka_ebs_optimized_volume_path : var.kafka_ebs_block_device[0].device_name
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

  name           = "${module.kafka_label.id}-az1"
  ami            = var.ami_id
  instance_type  = var.kafka_instance_type
  tags           = module.kafka_label.tags
  use_num_suffix = true

  associate_public_ip_address = false
  subnet_id                   = var.az1_subnet_id
  vpc_security_group_ids      = concat([aws_security_group.kafka_cluster.id], var.kafka_additional_security_groups)

  key_name             = var.ec2_key_pair_name
  iam_instance_profile = var.kafka_instance_profile
  user_data            = data.template_cloudinit_config.kafka.rendered

  ebs_optimized     = var.kafka_ebs_optimized
  root_block_device = var.kafka_root_block_device
}

resource "aws_ebs_volume" "kafka_nodes_az1" {
  count             = var.kafka_az1_count
  availability_zone = data.aws_subnet.az1[0].availability_zone
  size              = var.kafka_ebs_block_device[0].volume_size
  type              = var.kafka_ebs_block_device[0].volume_type
  tags              = module.kafka_label.tags
  iops              = lookup(var.kafka_ebs_block_device[0], "iops", null)
}

resource "aws_volume_attachment" "kafka_nodes_az1" {
  count       = var.kafka_az1_count
  device_name = var.kafka_ebs_block_device[0].device_name
  volume_id   = aws_ebs_volume.kafka_nodes_az1[count.index].id
  instance_id = module.kafka_nodes_az1.id[count.index]
}

module "kafka_nodes_az2" {
  source         = "terraform-aws-modules/ec2-instance/aws"
  version        = "~> 2.0"
  instance_count = var.kafka_az2_count

  name           = "${module.kafka_label.id}-az2"
  ami            = var.ami_id
  instance_type  = var.kafka_instance_type
  tags           = module.kafka_label.tags
  use_num_suffix = true

  associate_public_ip_address = false
  subnet_id                   = var.az2_subnet_id
  vpc_security_group_ids      = concat([aws_security_group.kafka_cluster.id], var.kafka_additional_security_groups)

  key_name             = var.ec2_key_pair_name
  iam_instance_profile = var.kafka_instance_profile
  user_data            = data.template_cloudinit_config.kafka.rendered

  ebs_optimized     = var.kafka_ebs_optimized
  root_block_device = var.kafka_root_block_device
}

resource "aws_ebs_volume" "kafka_nodes_az2" {
  count             = var.kafka_az2_count
  availability_zone = data.aws_subnet.az2[0].availability_zone
  size              = var.kafka_ebs_block_device[0].volume_size
  type              = var.kafka_ebs_block_device[0].volume_type
  tags              = module.kafka_label.tags
  iops              = lookup(var.kafka_ebs_block_device[0], "iops", null)
}

resource "aws_volume_attachment" "kafka_nodes_az2" {
  count       = var.kafka_az2_count
  device_name = var.kafka_ebs_block_device[0].device_name
  volume_id   = aws_ebs_volume.kafka_nodes_az2[count.index].id
  instance_id = module.kafka_nodes_az2.id[count.index]
}

module "kafka_nodes_az3" {
  source         = "terraform-aws-modules/ec2-instance/aws"
  version        = "~> 2.0"
  instance_count = var.kafka_az3_count

  name           = "${module.kafka_label.id}-az3"
  ami            = var.ami_id
  instance_type  = var.kafka_instance_type
  tags           = module.kafka_label.tags
  use_num_suffix = true

  associate_public_ip_address = false
  subnet_id                   = var.az3_subnet_id
  vpc_security_group_ids      = concat([aws_security_group.kafka_cluster.id], var.kafka_additional_security_groups)

  key_name             = var.ec2_key_pair_name
  iam_instance_profile = var.kafka_instance_profile
  user_data            = data.template_cloudinit_config.kafka.rendered

  ebs_optimized     = var.kafka_ebs_optimized
  root_block_device = var.kafka_root_block_device
}

resource "aws_ebs_volume" "kafka_nodes_az3" {
  count             = var.kafka_az3_count
  availability_zone = data.aws_subnet.az3[0].availability_zone
  size              = var.kafka_ebs_block_device[0].volume_size
  type              = var.kafka_ebs_block_device[0].volume_type
  tags              = module.kafka_label.tags
  iops              = lookup(var.kafka_ebs_block_device[0], "iops", null)
}

resource "aws_volume_attachment" "kafka_nodes_az3" {
  count       = var.kafka_az3_count
  device_name = var.kafka_ebs_block_device[0].device_name
  volume_id   = aws_ebs_volume.kafka_nodes_az3[count.index].id
  instance_id = module.kafka_nodes_az3.id[count.index]
}
