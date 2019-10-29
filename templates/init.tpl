repo_update: true
repo_upgrade: all

bootcmd:
  - test -z "$(blkid ${volume_path})" && mkfs -t xfs -L data ${volume_path}
  - install -d -o root -m 0750 ${fs_path}

mounts:
  - [ "${volume_path}", "${fs_path}", "xfs", "defaults,noatime", "0", "2" ]

runcmd:
  - amazon-linux-extras install epel
  - yum install -y python2-pip python3-pip python3-netaddr
  - pip3 install 'ansible<2.11'
  - yum install -y python3-urllib3 python-urllib3
  - pip uninstall -y urllib3