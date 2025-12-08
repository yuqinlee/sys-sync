#!/usr/bin/env bash
set -euo pipefail

REMOTE="nutclould:/keepass/uchin-pwd-l2.kdbx"
LOCAL="$HOME/.local/share/rclone/nutclould/keepass-remote/uchin-pwd-l2.kdbx"

notify() {
  notify-send -u critical "KeePass Remote Sync" "$1"
}

# Step 1: 拉取最新版本
notify-send "Pulling latest from remote..."
rclone copy "$REMOTE" "$(dirname "$LOCAL")" --update

# Step 2: 打开 KeePassXC
keepassxc "$LOCAL" &

# Step 3: 监控文件保存
inotifywait -m -e close_write "$LOCAL" | while read -r path _ file; do
  echo "Detected save: $file"

  TMPHASH=$(mktemp)
  rclone md5sum "$REMOTE" > "$TMPHASH" || true
  REMOTEHASH=$(grep mydb.kdbx "$TMPHASH" | awk '{print $1}' || echo "")
  LOCALHASH=$(md5sum "$LOCAL" | awk '{print $1}')
  rm -f "$TMPHASH"

  if [[ "$REMOTEHASH" != "" && "$REMOTEHASH" != "$LOCALHASH" ]]; then
    notify "冲突：远程文件已被修改，本地保存失败！请手动处理。"
    # 可考虑自动备份
    cp "$LOCAL" "$LOCAL.conflict.$(date +%s)"
  else
    echo "Pushing changes..."
    rclone copy "$LOCAL" "$REMOTE"
    notify "已成功推送到坚果云"
  fi
done

# Step 4: 轮询远程变化
while kill -0 "$KEEPASS_PID" 2>/dev/null; do
  sleep 15  # 每15秒检查一次
  REMOTEHASH=$(rclone md5sum "$REMOTE" | awk '{print $1}' || echo "")
  LOCALHASH=$(md5sum "$LOCAL" | awk '{print $1}')

  if [[ "$REMOTEHASH" != "" && "$REMOTEHASH" != "$LOCALHASH" ]]; then
    rclone copy "$REMOTE" "$(dirname "$LOCAL")" --update
    notify "远程文件已更新，本地已同步最新版本"
  fi
done
