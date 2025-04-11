#!/bin/bash

# kiểm tra root
if [ "$(id -u)" -ne 0 ]; then
  echo "Phải chạy bằng root hoặc sudo."
  exit 1
fi

set -v

# cập nhật hệ thống và cài gói cần thiết
yum -y update
yum -y install epel-release
yum -y install vim git curl wget net-tools zip unzip traceroute lsof cloud-utils-growpart dos2unix

# cấu hình timezone Việt Nam
timedatectl set-timezone Asia/Ho_Chi_Minh

# tắt dịch vụ rsyslog
systemctl stop rsyslog

# làm trống log hệ thống
[ -f /var/log/wtmp ] && truncate -s0 /var/log/wtmp
[ -f /var/log/lastlog ] && truncate -s0 /var/log/lastlog

# xóa tmp
rm -rf /tmp/*
rm -rf /var/tmp/*

# xóa SSH host key
rm -f /etc/ssh/ssh_host_*

# tạo rc.local mới với script resize disk LVM (CentOS 7)
cat << 'EOF' > /etc/rc.d/rc.local
#!/bin/bash

id | grep root 1>/dev/null 2>&1
if test $? = 0; then
  growpart /dev/sdc 1 > /dev/null 2>&1
  pvresize /dev/sdc1 > /dev/null 2>&1
  lvextend -l +100%FREE -r /dev/mapper/vg_sun-lv_root > /resize.txt 2>&1
  cat /resize.txt
else
  echo "Not root"
fi
exit 0
EOF

chmod +x /etc/rc.d/rc.local
systemctl enable rc-local
systemctl start rc-local

# tạo MOTD đơn giản
cat << 'EOM' > /etc/motd
********** Welcome to Thanh Quang **********
EOM

# tắt swap
swapoff -a
sed -i '/ swap / s/^/#/' /etc/fstab

# làm sạch machine-id và cloud-init
truncate -s 0 /etc/machine-id
rm -f /var/lib/dbus/machine-id
ln -s /etc/machine-id /var/lib/dbus/machine-id

# làm sạch cloud-init nếu có
if command -v cloud-init >/dev/null 2>&1; then
  cloud-init clean --logs
  touch /etc/cloud/cloud-init.disabled
fi

# xóa history
cat /dev/null > ~/.bash_history && history -c
