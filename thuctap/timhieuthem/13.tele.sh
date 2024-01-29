#!/bin/bash

TELEGRAM_BOT_TOKEN="6502841128:AAEE2aFHUarVKfrkS2YzeMjZe_-qF89Rza4"
TELEGRAM_CHAT_ID="6146875302"

send_telegram_message() {
    curl -s -X POST "https://api.telegram.org/bot$TELEGRAM_BOT_TOKEN/sendMessage" \
        -d chat_id="$TELEGRAM_CHAT_ID" \
        -d text="$text_log"
}

while true; do
    if inotifywait -e modify /var/log/cmd.log; then
        text_log=$(tail -n 1 /var/log/cmd.log | grep -E "useradd|userdel|rm")
        if [ -n "$text_log" ]; then
            echo "$text_log" >> /tmp/tele_log
            send_telegram_message
        fi
    fi
done