#!/bin/bash

# 记录上一次拍照的日期
last_date=""

while true; do
    # 获取当前日期和小时
    current_date=$(date +%Y%m%d)
    current_hour=$(date +%H)
    # current_hour=$(echo $current_hour | sed 's/^0*//')

    # 检查当前日期是否为新的一天
    if [[ "$current_date" != "$last_date" ]]; then
        echo "New day: $current_date"
        # 创建当天日期的文件夹（如果不存在）
        folder_name="${current_date}"
        mkdir -p "$folder_name"

        # 更新上一次拍照的日期
        last_date="$current_date"
    fi

    # 检查当前时间是否在拍摄时间段内（早上05点到下午23点）
    if ((10#$current_hour >= 6 && 10#$current_hour < 23)); then
        # 在时间段内，执行拍摄命令
        timestamp=$(date +"%Y%m%d%H%M%S")
        echo "Current hour: $current_hour; date: $timestamp"

        # 切换到日期文件夹
        cd "$folder_name"

        # 使用v4l2src获取照片 
        # 说明: gst-launch-1.0 是 GStreamer 工具中的一个命令行实用程序，用于构建和运行 GStreamer 流水线。v4l2src 是 GStreamer 中的一个元素（element），用于从 Video4Linux2（v4l2）设备（通常是摄像头）获取视频数据。
        filename="${timestamp}.jpg"
	    sudo gst-launch-1.0 -v v4l2src num-buffers=1 device=/dev/video1 ! jpegenc ! filesink location= "$filename"

        # 切回上级目录
        cd ..
    else
        # 不在时间段内，不执行拍摄命令
        timestamp=$(date +"%Y%m%d%H%M%S")
        echo "Not within the capture time range. date: $timestamp"
    fi

    # 等待1分钟
    sleep 60

done
