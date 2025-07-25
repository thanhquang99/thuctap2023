#!/bin/bash

# Kiểm tra quyền root
if [ "$(id -u)" -ne 0 ]; then
    echo "Need sudo/root"
    exit 1
fi

# 1. Lấy thông tin OS
function get_distribution {
    if [ -e /etc/os-release ]; then
        source /etc/os-release
        DISTRIBUTION=$ID
        VERSION=$VERSION_ID
    elif [ -e /etc/lsb-release ]; then
        source /etc/lsb-release
        DISTRIBUTION=$DISTRIB_ID
        VERSION=$DISTRIB_RELEASE
    else
        DISTRIBUTION="unknown"
        VERSION="unknown"
    fi
}

# 2. Sửa repo cho CentOS 7/8
function fix_centos_repo {
    echo "Fixing CentOS repo for $VERSION..."
    sed -i s/mirror.centos.org/vault.centos.org/g /etc/yum.repos.d/*.repo
    sed -i s/^#.*baseurl=http/baseurl=http/g /etc/yum.repos.d/*.repo
    sed -i s/^mirrorlist=http/#mirrorlist=http/g /etc/yum.repos.d/*.repo
    echo "sslverify=false" >> /etc/yum.conf
}

# 3. Update & upgrade
function update_upgrade {
    if [ "$DISTRIBUTION" == "ubuntu" ]; then
        apt update && apt upgrade -y
    elif [ "$DISTRIBUTION" == "centos" ] || [ "$DISTRIBUTION" == "rhel" ]; then
        yum update -y
    else
        echo "Unsupported OS for update/upgrade."
    fi
}

# 4. Cài đặt VMware Tools
function install_vmware_tools {
    if [ "$DISTRIBUTION" == "ubuntu" ]; then
        apt update && apt install -y open-vm-tools
    elif [ "$DISTRIBUTION" == "centos" ] || [ "$DISTRIBUTION" == "rhel" ]; then
        yum install -y open-vm-tools
    else
        echo "Không hỗ trợ cài VMware Tools cho OS này."
    fi
}

# 5. Cấu hình cmdlog cho root
function log-root {
    echo "# Command log" >> ~/.bashrc
    echo 'export IP_CLIENT=$(who am i | awk '\''{print $5}'\'')' >> ~/.bashrc
    echo "export HISTTIMEFORMAT=\"\$LOGNAME \$IP_CLIENT %d/%m/%y %T \"" >> ~/.bashrc
    echo 'export PROMPT_COMMAND='\''RETRN_VAL=$?; logger -p local6.info "$(history 1)[$RETRN_VAL]"'\''' >> ~/.bashrc
}

# 6. Cấu hình cmdlog cho user mới
function user-log {
    echo "# Command log" >> /etc/skel/.bashrc
    echo 'export IP_CLIENT=$(who am i | awk '\''{print $5}'\'')' >> /etc/skel/.bashrc
    echo "export HISTTIMEFORMAT=\"\$LOGNAME \$IP_CLIENT %d/%m/%y %T \"" >> /etc/skel/.bashrc
    echo 'export PROMPT_COMMAND='\''RETRN_VAL=$?; logger -p local6.info "$(history 1)[$RETRN_VAL]"'\''' >> /etc/skel/.bashrc
}

# 7. Cấu hình rsyslog cho CentOS
function rsyslog-config-centos {
    echo "local6.* /var/log/cmd.log " >> /etc/rsyslog.conf
    systemctl restart rsyslog
}

# 8. Cấu hình rsyslog cho Ubuntu
function rsyslog-config-ubuntu {
    echo "local6.* /var/log/cmd.log " >> /etc/rsyslog.d/50-default.conf
    systemctl restart rsyslog
}

# 9. Cấu hình logrotate cho cmd.log
function logrotate_cmdlog {
    cat <<EOF > /etc/logrotate.d/cmdlog
/var/log/cmd.log {
    size 100M
    rotate 4
    create
    dateext
    compress
}
EOF
}

# 10. Cài đặt và cấu hình cmdlog
function setup_cmdlog {
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
        echo "Đang cấu hình cho logrotate"
        logrotate_cmdlog
        echo "Chuẩn bị logout sau 5s"
        sleep 5
    fi
}

# 11. Sinh script mở rộng phân vùng root vào rc.local (tự động cho cả Ubuntu/CentOS)
function setup_autogrow_lvm_rc_local {
    get_distribution

    # Cài đặt các công cụ cần thiết
    if [ "$DISTRIBUTION" == "ubuntu" ]; then
        apt-get update
        apt-get install -y cloud-guest-utils lvm2
    elif [ "$DISTRIBUTION" == "centos" ] || [ "$DISTRIBUTION" == "rhel" ]; then
        yum install -y cloud-utils-growpart lvm2
    fi

    ROOT_DEV=$(df -Th | awk '$7=="/"{print $1}')
    FSTYPE=$(df -Th | awk '$7=="/"{print $2}')
    VG_NAME=$(lvs --noheadings -o vg_name "$ROOT_DEV" | awk '{print $1}')
    PV_PATH=$(pvs --noheadings -o pv_name --select vg_name="$VG_NAME" | awk '{print $1}' | head -n1)
    PV_BASE=$(basename "$PV_PATH" | sed 's/[0-9]*$//')
    PART_NUM=$(basename "$PV_PATH" | grep -o '[0-9]*$')

    cat <<EOF > /etc/rc.local
#!/bin/sh
id | grep root 1>/dev/null 2>&1
if test 0 = 0; then
   growpart /dev/${PV_BASE} ${PART_NUM} > /dev/null 2>&1
   pvresize $PV_PATH > /dev/null 2>&1
   lvextend -l +100%FREE -r $ROOT_DEV > /root/resize.txt 2>&1; cat /root/resize.txt | grep GiB
   $( [ "$FSTYPE" = "xfs" ] && echo "xfs_growfs $ROOT_DEV" || echo "resize2fs $ROOT_DEV" ) > /dev/null 2>&1
fi
exit 0
EOF

    chmod +x /etc/rc.local

    if [ "$DISTRIBUTION" == "ubuntu" ]; then
        systemctl unmask rc-local
        cat <<EOF > /etc/systemd/system/rc-local.service
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
EOF
        systemctl daemon-reload
        systemctl enable rc-local
        systemctl start rc-local.service
    else
        mkdir -p /etc/rc.d
        ln -sf /etc/rc.local /etc/rc.d/rc.local
        chmod +x /etc/rc.d/rc.local
        systemctl enable rc-local
        systemctl start rc-local
    fi
    echo "Đã cấu hình tự động mở rộng phân vùng root vào /etc/rc.local"
}

# 12. Xóa machine-id
function reset_machine_id {
    echo "Resetting machine-id..."
    truncate -s 0 /etc/machine-id
    rm -f /var/lib/dbus/machine-id
    ln -s /etc/machine-id /var/lib/dbus/machine-id
}

# 13. Main function
function main {
    get_distribution
    echo "Distribution: $DISTRIBUTION"
    echo "Version: $VERSION"

    # Fix CentOS 7/8 repo nếu cần
    if [ "$DISTRIBUTION" == "centos" ] && ([[ "$VERSION" == "7"* ]] || [[ "$VERSION" == "8"* ]]); then
        fix_centos_repo
    fi

    update_upgrade
    install_vmware_tools
    setup_cmdlog
    setup_autogrow_lvm_rc_local
    reset_machine_id
    echo "Đã hoàn thành các bước cấu hình hệ thống."
    echo "Vui lòng khởi động lại hệ thống để áp dụng các thay đổi."
}

main