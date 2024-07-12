#!/bin/bash

function log-root {
    echo "# Command log" >> ~/.bashrc
    echo 'export IP_CLIENT=$(who am i | awk '\''{print $5}'\'')' >> ~/.bashrc
    echo "export HISTTIMEFORMAT=\"\$LOGNAME \$IP_CLIENT %d/%m/%y %T \"" >> ~/.bashrc
    echo 'export PROMPT_COMMAND='\''RETRN_VAL=$?; logger -p local6.info "$(history 1) [$RETRN_VAL]"'\''' >> ~/.bashrc
}

function user-log {
    echo "# Command log" >> /etc/skel/.bashrc
    echo 'export IP_CLIENT=$(who am i | awk '\''{print $5}'\'')' >> /etc/skel/.bashrc
    echo "export HISTTIMEFORMAT=\"\$LOGNAME \$IP_CLIENT %d/%m/%y %T \"" >> /etc/skel/.bashrc
    echo 'export PROMPT_COMMAND='\''RETRN_VAL=$?; logger -p local6.info "$(history 1) [$RETRN_VAL]"'\''' >> /etc/skel/.bashrc
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
    touch /etc/logrotate.d/cmdlog
    echo "/var/log/cmd.log {" >> /etc/logrotate.d/cmdlog
    echo "size 100M" >> /etc/logrotate.d/cmdlog
    echo "rotate 4" >> /etc/logrotate.d/cmdlog
    echo "create" >> /etc/logrotate.d/cmdlog
    echo "dateext" >> /etc/logrotate.d/cmdlog
    echo "compress" >> /etc/logrotate.d/cmdlog
    echo "}" >> /etc/logrotate.d/cmdlog
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
    logrotate
    echo "Chuẩn bị logout sau 5s"
    sleep 5
    exit
fi
