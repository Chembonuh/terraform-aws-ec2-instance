terraform {
  required_version = ">= 1.3.0"

  backend "remote" {
    hostname     = "app.terraform.io"
    organization = "chem"

    workspaces {
      name = "terraform-aws-ec2-instance"
    }
  }
}

provider "aws" {
  region = var.region
}

resource "aws_instance" "web_server" {
  ami           = var.instance_ami
  instance_type = var.instance_type
  key_name      = var.key_name

  ebs_block_device {
    device_name = "/dev/sdh"
    volume_size = var.volume_size
  }

  user_data = <<-EOF
              #!/bin/bash
              set -e

              # Install LVM and XFS tools
              yum install -y lvm2 xfsprogs

              # Identify the main disk (exclude root disk)
              DISK=$(lsblk -dpno NAME | grep -v nvme0n1 | head -n 1)

              # Partition the disk: 2GB for /boot, rest as LVM PV
              parted -s $DISK mklabel gpt
              parted -s $DISK mkpart primary xfs 1MiB 2049MiB
              parted -s $DISK mkpart primary 2049MiB 100%

              # Format and mount /boot
              mkfs.xfs ${DISK}1
              mkdir -p /boot
              mount ${DISK}1 /boot
              echo "${DISK}1 /boot xfs defaults 0 2" >> /etc/fstab

              # Create LVM Physical Volume
              pvcreate ${DISK}2
              vgcreate vg00 ${DISK}2

              # Create Logical Volumes
              lvcreate -L 20G -n usrlv vg00
              lvcreate -L 16G -n swap vg00
              lvcreate -L 4G  -n optlv vg00
              lvcreate -L 4G  -n corplv vg00
              lvcreate -L 4G  -n tmplv vg00
              lvcreate -L 16G -n homelv vg00
              lvcreate -L 20G -n rootlv vg00
              lvcreate -L 20G -n varlv vg00

              # Format logical volumes (XFS except swap)
              mkfs.xfs /dev/vg00/usrlv
              mkfs.xfs /dev/vg00/optlv
              mkfs.xfs /dev/vg00/corplv
              mkfs.xfs /dev/vg00/tmplv
              mkfs.xfs /dev/vg00/homelv
              mkfs.xfs /dev/vg00/rootlv
              mkfs.xfs /dev/vg00/varlv
              mkswap /dev/vg00/swap

              # Create mount points
              mkdir  /corp

              # Mount logical volumes
              mount /dev/vg00/usrlv /usr
              mount /dev/vg00/optlv /opt
              mount /dev/vg00/corplv /corp
              mount /dev/vg00/tmplv /tmp
              mount /dev/vg00/homelv /home
              mount /dev/vg00/rootlv /
              mount /dev/vg00/varlv /var
              swapon /dev/vg00/swap

              # Persist mounts in /etc/fstab
              echo "/dev/vg00/usrlv /usr xfs defaults 0 2" >> /etc/fstab
              echo "/dev/vg00/optlv /opt xfs defaults 0 2" >> /etc/fstab
              echo "/dev/vg00/corplv /corp xfs defaults 0 2" >> /etc/fstab
              echo "/dev/vg00/tmplv /tmp xfs defaults 0 2" >> /etc/fstab
              echo "/dev/vg00/homelv /home xfs defaults 0 2" >> /etc/fstab
              echo "/dev/vg00/rootlv / xfs defaults 0 2" >> /etc/fstab
              echo "/dev/vg00/varlv /var xfs defaults 0 2" >> /etc/fstab
              echo "/dev/vg00/swap none swap sw 0 0" >> /etc/fstab
              EOF

  tags = var.tags
}
