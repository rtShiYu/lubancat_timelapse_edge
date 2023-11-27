#!/bin/bash
LOG_FILE="/home/cat/workspace/photo/check_log.txt"
cd /home/cat/workspace/photo

current_date=$(date +%Y%m%d%H%M%S)

# 检查拍照进程是否正在运行
if ! pgrep -f "bash ./takephoto.sh" > /dev/null; then
    # 拍照进程没有在运行，重新启动拍照脚本
    echo "The script is not running. Executing the script now... date: $current_date" >> "$LOG_FILE"
    bash ./takephoto.sh >> ./log.txt &
else
    echo "The script is already running. No action needed. date: $current_date" >> "$LOG_FILE"
fi
