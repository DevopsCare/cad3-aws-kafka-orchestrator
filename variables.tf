# General
variable "label" {
  description = "https://github.com/cloudposse/terraform-null-label compatible module"
}

variable "domain" {
  type = string
}

variable "ec2_key_pair_name" {
  default = ""
}

variable "ansible_inventory_file_location" {
  default = ""
}

# Network
variable "vpc_id" {
  type = string
}

variable "az1_subnet_id" {
  type = string
}
variable "az2_subnet_id" {
  type    = string
  default = ""
}
variable "az3_subnet_id" {
  type    = string
  default = ""
}

# AMI
variable "ami_id" {
  default = "ami-02eac2c0129f6376b" # us-east-1:centos7-1901_01
}

# Kafka params
variable "kafka_additional_user_data" {
  type    = string
  default = <<-EOF
  EOF
}

variable "kafka_instance_type" {
  default = "t2.xlarge"
}

variable "kafka_root_block_device" {
  default = [{
    volume_type           = "gp2"
    volume_size           = 10
  }]
}

variable "kafka_ebs_block_device" {
  default = [{
    device_name           = "/dev/xvdb"
    volume_type           = "gp2"
    volume_size           = 30
  }]
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

variable "kafka_additional_security_groups" {
  type    = list(string)
  default = []
}

variable "kafka_instance_profile" {
  type    = string
  default = ""
}

# Zookeeper params
variable "zookeeper_additional_user_data" {
  type    = string
  default = <<-EOF
EOF
}

variable "zookeeper_instance_type" {
  default = "t2.large"
}

variable "zookeeper_root_block_device" {
  default = [{
    volume_type           = "gp2"
    volume_size           = 10
    delete_on_termination = true
  }]
}

variable "zookeeper_ebs_block_device" {
  default = [{
    device_name           = "/dev/xvdb"
    volume_type           = "gp2"
    volume_size           = 30
    delete_on_termination = true
  }]
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

variable "zookeeper_additional_security_groups" {
  type    = list(string)
  default = []
}

variable "zookeeper_instance_profile" {
  type    = string
  default = ""
}

# Route53
variable "route53_zone_id" {
  type = string
}
