# General

variable "cluster_name" {}

variable "additional_tags" {
  type = map
  default = {}
}

variable "root_domain" {
  type    = string
  default = ""
}
variable "environment_name" {
  type    = string
  default = ""
}
variable "scheduler_name" {
  type = string
}

variable "ec2_key_pair_name" {}

# Network

variable "ip_whitelist" {
  type = list(string)
  default = []
}
variable "vpc_id" {
  type = string
}
variable "az1_subnet_id" {
  type = string
}
variable "az2_subnet_id" {
  type = string
  default = ""
}
variable "az3_subnet_id" {
  type = string
  default = ""
}

# Ansible

variable "ansible_kafka_params_file" {}

# AMI

data "aws_ami" "ami" {
  filter {
    name   = "name"
    values = ["OCC-Kafka-Zookeeper-Image-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners      = ["920715010324"]
  most_recent = true
}

# Kafka params

variable "kafka_instance_type" {
  default = "t2.xlarge"
}

variable "kafka_root_block_device" {
  default = [{
      volume_type           = "gp2"
      volume_size           = 20
      delete_on_termination = true
    },]
}

variable "kafka_ebs_block_device" {
  default = [{
        device_name           = "/dev/xvdb"
        volume_type           = "gp2"
        volume_size           = 30
        delete_on_termination = true
    },]
}

variable "kafka_az1_count" {
  default = 1
}

variable "kafka_az2_count" {
  default = 0
}

variable "kafka_az3_count" {
  default = 0
}

variable "kafka_user_data" {
  type    = string
  default = <<-EOF
          #!/bin/bash
          FS_PATH="/kafka"
          VOLUME_NAME="/dev/xvdb"
          mkfs.xfs $VOLUME_NAME
          install -d -o root -m 0750 $FS_PATH
          mount -t xfs $VOLUME_NAME $FS_PATH
          VOLUME_UUID=$(blkid -o export $VOLUME_NAME | grep UUID | cut -d '=' -f 2)
          echo "UUID=$VOLUME_UUID $FS_PATH xfs defaults,noatime 0 0" >> /etc/fstab
EOF
}

variable "kafka_user_data_extra" {
  type    = string
  default = ""
}

variable "kafka_additional_security_groups" {
  type    = list
  default = []
}

variable "kafka_instance_profile" {}

# Zookeeper params

variable "zookeeper_instance_type" {
  default = "t2.large"
}

variable "zookeeper_root_block_device" {
  default = [{
      volume_type           = "gp2"
      volume_size           = 20
      delete_on_termination = true
    },]
}

variable "zookeeper_ebs_block_device" {
  default = [{
        device_name           = "/dev/xvdb"
        volume_type           = "gp2"
        volume_size           = 30
        delete_on_termination = true
    },]
}

variable "zookeeper_az1_count" {
  default = 1
}

variable "zookeeper_az2_count" {
  default = 0
}

variable "zookeeper_az3_count" {
  default = 0
}

variable "zookeeper_user_data" {
  type    = string
  default = <<-EOF
          #!/bin/bash
          FS_PATH="/zookeeper"
          VOLUME_NAME=/dev/xvdb
          mkfs.xfs $VOLUME_NAME
          install -d -o root -m 0750 $FS_PATH
          mount -t xfs $VOLUME_NAME $FS_PATH
          VOLUME_UUID=$(blkid -o export $VOLUME_NAME | grep UUID | cut -d '=' -f 2)
          echo "UUID=$VOLUME_UUID $FS_PATH xfs defaults,noatime 0 0" >> /etc/fstab
EOF
}

variable "zookeeper_user_data_extra" {
  type    = string
  default = ""
}

variable "zookeeper_additional_security_groups" {
  type    = list
  default = []
}

variable "zookeeper_instance_profile" {}

# Route53

variable "route53_zone_id" {}

# Kubernetes

variable "kubernetes_namespace" {
  default = "jx"
}

variable "kubernetes_secret_name" {
  default = "occ-ssh-key"
}
