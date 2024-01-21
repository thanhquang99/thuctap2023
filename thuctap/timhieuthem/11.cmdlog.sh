#!/bin/bash

function log-root {
    echo "# Command log" >> ~/.bashrc
    echo "export IP_CLIENT=\$(echo \$SSH_CLIENT | awk '{print \$1}')" >> ~/.bashrc
    echo "export PROMPT_COMMAND='logger -p local6.info \"\$SUDO_USER \$LOGNAME \$IP_CLIENT \$(history 1 )\"'" >> ~/.bashrc
}

function user-log {
    echo "# Command log" >> /etc/skel/.bashrc
    echo "export IP_CLIENT=\$(echo \$SSH_CLIENT | awk '{print \$1}')" >> /etc/skel/.bashrc
    echo "export PROMPT_COMMAND='logger -p local6.info \"\$SUDO_USER \$LOGNAME \$IP_CLIENT \$(history 1 )\"'" >> /etc/skel/.bashrc
}

function rsyslog-config {
    touch /var/log/cmd.log
    echo "local6.* /var/log/cmd.log " >> /etc/rsyslog.conf
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

if [ -e /var/log/cmd.log ]; then
    echo "Bạn đã cài đặt cmd.log trước đó."
else 
    echo "Đang cấu hình cmd log cho root"
    log-root
    source ~/.bashrc
    echo "Đang cấu hình cmd log cho user"
    user-log
    echo "Đang cấu hình cho rsyslog"
    rsyslog-config
    echo "Đang cấu hình cho logrotate"
    logrotate
    echo "Chuẩn bị restart lại máy trong 5s"
    sleep 5
    init 6
fi