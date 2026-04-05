#!/bin/bash

REMOTE="nutcloud:/keepass/"
MOUNTPOINT="/data/data-local/share/keepass/db/"
LOG_DIR="$HOME/.local/share/rclone"

# 如果没创建文件夹先创建
mkdir -p "$MOUNTPOINT"
mkdir -p "$LOG_DIR"

# 防止重复挂载
if mount | grep "$MOUNTPOINT" > /dev/null; then
  exit 0
fi

# 等待网络稳定
sleep 5

rclone mount --allow-non-empty "$REMOTE" "$MOUNTPOINT" \
    --vfs-cache-mode full \
    --vfs-cache-max-size 1G \
    --vfs-cache-max-age 24h \
    --dir-cache-time 12h \
    --poll-interval 10m \
    --timeout 1m \
    --contimeout 10s \
    --retries 10 \
    --low-level-retries 20 \
    --log-file $LOG_DIR/rclone.log \
    --log-level INFO \
    --umask 022

