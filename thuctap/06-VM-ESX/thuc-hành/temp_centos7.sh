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

LOG_FILE="/var/log/lvm-auto-resize.log"
echo "====== $(date) ======" >> "$LOG_FILE"

id | grep root 1>/dev/null 2>&1
if test $? = 0; then
  echo "Đang thực hiện growpart..." >> "$LOG_FILE"
  growpart /dev/sdc 1 >> "$LOG_FILE" 2>&1

  echo "Đang thực hiện pvresize..." >> "$LOG_FILE"
  pvresize /dev/sdc1 >> "$LOG_FILE" 2>&1

  echo "Đang thực hiện lvextend..." >> "$LOG_FILE"
  lvextend -l +100%FREE -r /dev/mapper/vg_sun-lv_root >> "$LOG_FILE" 2>&1

  echo "Đã hoàn tất mở rộng LVM." >> "$LOG_FILE"
else
  echo "Không chạy bằng quyền root." >> "$LOG_FILE"
fi

echo "=======================" >> "$LOG_FILE"
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

#########################################################
### Phần bổ sung: cấu hình ghi log lệnh (cmd log)     ###
#########################################################

function log-root {
    echo "# Command log" >> ~/.bashrc
    echo 'export IP_CLIENT=$(who am i | awk '\''{print $5}'\'')' >> ~/.bashrc
    echo "export HISTTIMEFORMAT=\"\$LOGNAME \$IP_CLIENT %d/%m/%y %T \"" >> ~/.bashrc
    echo 'export PROMPT_COMMAND='\''RETRN_VAL=$?; logger -p local6.info "$(history 1)[$RETRN_VAL]"'\''' >> ~/.bashrc
}

function user-log {
    echo "# Command log" >> /etc/skel/.bashrc
    echo 'export IP_CLIENT=$(who am i | awk '\''{print $5}'\'')' >> /etc/skel/.bashrc
    echo "export HISTTIMEFORMAT=\"\$LOGNAME \$IP_CLIENT %d/%m/%y %T \"" >> /etc/skel/.bashrc
    echo 'export PROMPT_COMMAND='\''RETRN_VAL=$?; logger -p local6.info "$(history 1)[$RETRN_VAL]"'\''' >> /etc/skel/.bashrc
}

function rsyslog-config-centos {
    echo "local6.* /var/log/cmd.log " >> /etc/rsyslog.conf
    systemctl restart rsyslog
}

function rsyslog-config-ubuntu {
    echo "local6.* /var/log/cmd.log " >> /etc/rsyslog.d/50-default.conf
    systemctl restart rsyslog
}

function logrotate {
    cat << 'EOF' > /etc/logrotate.d/cmdlog
/var/log/cmd.log {
    size 100M
    rotate 4
    create
    dateext
    compress
}
EOF
}

function get_distribution {
    if [ -e /etc/os-release ]; then
        source /etc/os-release
        DISTRIBUTION=$ID
        VERSION=$VERSION_ID
    elif [ -e /etc/lsb-release ]; then
        source /etc/lsb-release
        DISTRIBUTION=$DISTRIB_ID
        VERSION=$DISTRIB_RELEASE
    fi
}

# kiểm tra nếu đã có cmd.log thì bỏ qua
if [ -e /var/log/cmd.log ]; then
    echo "Bạn đã cài đặt cmd.log trước đó."
else
    echo "Đang cấu hình cmd log cho root"
    log-root
    source ~/.bashrc
    echo "Đang cấu hình cmd log cho user"
    user-log
    echo "Đang cấu hình cho rsyslog"
    get_distribution
    if [ "$DISTRIBUTION" == "ubuntu" ]; then
        rsyslog-config-ubuntu
    elif [ "$DISTRIBUTION" == "centos" ]; then
        rsyslog-config-centos
    fi
    echo "Đang cấu hình logrotate cho cmd.log"
    logrotate
fi

# xóa history ở cuối cùng
cat /dev/null > ~/.bash_history && history -c
