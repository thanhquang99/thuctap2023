#!/bin/bash

# nếu không phải root thì thoát
if [ "$(id -u)" -ne 0 ]; then
  echo "Need sudo"
  exit 1
fi

set -v

# xóa user u22 và u24 nếu tồn tại
for user in u22 u24; do
  id "$user" &>/dev/null && userdel "$user"
done

# cập nhật hệ thống
apt update -y
apt dist-upgrade -y
apt autoremove -y

# cấu hình timezone Việt Nam
timedatectl set-timezone Asia/Ho_Chi_Minh

# cài đặt gói cơ bản
apt install -y jq vim git dos2unix zip unzip curl wget dnsutils traceroute swaks open-vm-tools

# cấu hình VMware tools (nếu chạy trong VM)
vmware-toolbox-cmd config set deployPkg enable-custom-scripts true

# dọn dẹp hệ thống
apt autoremove -y
apt clean

# dừng rsyslog
service rsyslog stop

# xóa log hệ thống
[ -f /var/log/wtmp ] && truncate -s0 /var/log/wtmp
[ -f /var/log/lastlog ] && truncate -s0 /var/log/lastlog

# dọn /tmp và /var/tmp
rm -rf /tmp/*
rm -rf /var/tmp/*

# xóa SSH host key cũ
rm -f /etc/ssh/ssh_host_*

# tạo rc.local để khởi tạo SSH key và resize LVM (nếu cần)
cat << 'EOL' > /etc/rc.local
#!/bin/sh
test -f /etc/ssh/ssh_host_dsa_key || dpkg-reconfigure openssh-server

growpart /dev/sda 3 > /dev/null 2>&1
pvresize /dev/sda3 > /dev/null 2>&1
lvextend -l +100%FREE -r /dev/mapper/ubuntu--vg-ubuntu--lv > /resize.txt 2>&1

exit 0
EOL

chmod +x /etc/rc.local

# tạo systemd unit cho rc.local
cat << 'EOL' > /etc/systemd/system/rc-local.service
[Unit]
Description=/etc/rc.local Compatibility
ConditionPathExists=/etc/rc.local

[Service]
Type=forking
ExecStart=/etc/rc.local start
TimeoutSec=0
StandardOutput=tty
RemainAfterExit=yes
SysVStartPriority=99

[Install]
WantedBy=multi-user.target
EOL

systemctl enable rc-local
systemctl start rc-local

# đặt lại hostname
sed -i 's/preserve_hostname: false/preserve_hostname: true/g' /etc/cloud/cloud.cfg
truncate -s0 /etc/hostname
hostnamectl set-hostname localhost

# MOTD đơn giản (không banner, không website)
cat << 'EOF' > /etc/motd
********** Welcome to Thanh Quang **********
EOF

# vô hiệu hóa swap
swapoff -a
sed -ri '/\sswap\s/s/^#?/#/' /etc/fstab

# làm mới machine-id và liên kết với dbus
truncate -s 0 /etc/machine-id
rm -f /var/lib/dbus/machine-id
ln -s /etc/machine-id /var/lib/dbus/machine-id

# làm sạch cloud-init và ngăn không cho chạy lại
cloud-init clean --logs
touch /etc/cloud/cloud-init.disabled

# xóa lịch sử shell
cat /dev/null > ~/.bash_history && history -c
