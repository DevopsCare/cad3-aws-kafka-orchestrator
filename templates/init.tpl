#
# Copyright (c) 2020 Risk Focus Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
#

repo_update: true
repo_upgrade: all

mounts:
  - [ "LABEL=data", "${fs_path}", "xfs", "defaults,noatime", "0", "2" ]

runcmd:
  - export EXTRA_EBS=$( lsblk  -lno name,type,uuid | tac | awk '{if ($2=="part") {used_disk=1} else if ($2=="disk") {if (used_disk==1 || $3!="") {used_disk=0} else { print $1} } }' )
  - mkfs -t xfs -L data /dev/$EXTRA_EBS
  - install -d -o root -m 0750 ${fs_path}
  - mount $(findfs LABEL=data) ${fs_path}

  - amazon-linux-extras install epel
  - yum install -y python2-pip python3-pip python3-netaddr
  - pip3 install 'ansible<2.11'
  - yum install -y python3-urllib3
  - pip uninstall -y urllib3
