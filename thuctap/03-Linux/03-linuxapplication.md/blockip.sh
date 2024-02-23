#!/bin/bash

LOG_FILE="/var/log/secure"
STATE_FILE="/tmp/bad_ip"

# Tạo tệp bad_ip nếu nó không tồn tại
touch "$STATE_FILE"

# Lấy ip ssh failed trong 1 phút
current_time=$(date "+%b %d %H:%M:%S")
one_minute_ago=$(date -d '1 minute ago' '+%b %d %H:%M:%S')
formatted_time1=$(date -d "$one_minute_ago" "+%d%H%M%S")
formatted_time=$(date -d "$current_time" "+%d%H%M%S")

failed_ips=($(grep "sshd.*Failed password" "$LOG_FILE" | awk -v start_time="$one_minute_ago" -v end_time="$current_time" '$1 " " $2 " " $3 >= start_time && $1 " " $2 " " $3 <= end_time {print $(NF-3)}' | sort | uniq -c | awk '$1 > 3 {print $2}'))

if [ ${#failed_ips[@]} -gt 0 ]; then
    for failed_ip in "${failed_ips[@]}"; do
        sudo iptables -A INPUT -s "$failed_ip" -j DROP
        echo "$formatted_time $failed_ip" >> "$STATE_FILE"
    done
fi

# Unban IP sau thời gian đủ
ip_unbans=($(grep "$formatted_time1" "$STATE_FILE" | awk '{print $2}'))

if [ ${#ip_unbans[@]} -gt 0 ]; then
    for ip_unban in "${ip_unbans[@]}"; do
        echo $ip_unban
        sudo iptables -D INPUT -s "$ip_unban" -j DROP
    done
fi
sudo service iptables save
sudo service iptables reload

# Đây là script kết hợp với crontab chạy 1 phút 1 lần. và đây chỉ là test thôi nên tôi để biến $one_minute_ago là 1 phút trước
# Nếu các bạn muốn thay đổi thì có thể đặt biến $one_minute_ago thành thời gian theo ý muốn của các bạn và sửa lại thời gian chạy file của crontab trùng với $one_minute_ago