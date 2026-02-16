#!/bin/bash
set -euo pipefail

# public config stow
stow \
    --target $HOME . \
    --adopt \
    --ignore multi \
    --ignore etc \
    --ignore stow-on.sh \
    --ignore stow-off.sh \
    --ignore README.md \

# # 获取第一个显示器 description
# DESC=$(hyprctl monitors -j | jq -r '.[0].description')
#
# # 提取前两个字段（去掉后面的序列号）
# KEY=$(echo "$DESC" | awk '{print $1" "$2}')
#
# STOW_DIR="./multi"
#
# # 在目录中模糊匹配
# MATCH=$(find "$STOW_DIR" -maxdepth 1 -type d -iname "*$KEY*" | head -n 1)
# echo $MATCH
#
# if [[ -d "$STOW_DIR/$MATCH" ]]; then
#      stow --dir "$STOW_DIR" --target "$HOME" "$MATCH" --adopt
# fi


HOST="$(uname -n)"
STOW_DIR="./multi"

if [[ -d "$STOW_DIR/$HOST" ]]; then
    stow \
        --dir "$STOW_DIR" \
        --target "$HOME" "$HOST" \
        --adopt
fi

