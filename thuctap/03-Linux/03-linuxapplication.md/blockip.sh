#!/bin/bash

LOG_FILE="/var/log/secure"
STATE_FILE="/tmp/bad_ip"
BAN_TIME=600 # 10 phút

# Tạo tệp bad_ip nếu nó không tồn tại
touch "$STATE_FILE"

while true; do
    current_time=$(date "+%b %d %H:%M:%S")
    one_minute_ago=$(date -d '1 minute ago' '+%b %d %H:%M:%S')

    failed_ips=($(grep "sshd.*Failed password" "$LOG_FILE" | awk -v start_time="$one_minute_ago" -v end_time="$current_time" '$1 " " $2 " " $3 >= start_time && $1 " " $2 " " $3 <= end_time {print $(NF-3)}' | sort | uniq -c | awk '$1 > 3 {print $2}'))

    # Lấy thời gian từ file /tmp/bad_ip
    time_ip=$(awk '{print $1, $2, $3}' "$STATE_FILE")
    current_timestamp=$(date +%s)
    time_difference=$((current_timestamp - timestamp_ip))

    # Chặn địa chỉ IP nếu có
    if [ ${#failed_ips[@]} -gt 0 ]; then
        for failed_ip in "${failed_ips[@]}"; do
            iptables -A INPUT -s "$failed_ip" -j DROP
            echo "$(date "+%b %d %H:%M:%S") $failed_ip" >> "$STATE_FILE"
        done
        service iptables save
        service iptables reload
    fi

    # Kiểm tra và unban IP nếu đã qua thời gian quy định
    while read -r line; do
        entry_time=$(echo "$line" | awk '{print $1, $2, $3}')
        if [ "$entry_time" \< "$current_time" ]; then
            unban_ip=$(echo "$line" | awk '{print $4}')
            iptables -D INPUT -s "$unban_ip" -j DROP
            # Xóa chỉ những IP đã qua thời gian quy định
            grep -v "$line" "$STATE_FILE" > /tmp/bad_ip_tmp
            mv /tmp/bad_ip_tmp "$STATE_FILE"
            service iptables save
            service iptables reload
        fi
    done < "$STATE_FILE"

    sleep 60
done
