#!/bin/bash
growpart /dev/nvme0n1 4
pvresize /dev/nvme0n1p4
lvextend -L 20G /dev/mapper/RootVG-varVol
xfs_growfs /var
dnf -y install dnf-plugins-core
dnf config-manager --add-repo https://download.docker.com/linux/rhel/docker-ce.repo
dnf install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
systemctl start docker
systemctl enable docker
usermod -aG docker ec2-user
newgrp docker
