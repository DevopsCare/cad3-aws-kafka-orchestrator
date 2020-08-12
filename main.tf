
/*
*Copyright (c) 2020 Risk Focus Inc.
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
