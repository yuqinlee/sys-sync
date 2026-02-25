#!/bin/bash

# 切换当前普通工作区窗口的平铺/浮动状态

# 获取当前活动窗口的工作区信息
active_workspace=$(hyprctl activeworkspace -j 2>/dev/null)

# 检查是否成功获取工作区信息
if [ -z "$active_workspace" ] || [ "$active_workspace" = "null" ] || [ "$active_workspace" = "" ]; then
    # 无法获取工作区信息，静默退出
    exit 0
fi

# 检查是否在特殊工作区
workspace_name=$(echo "$active_workspace" | jq -r '.name')
workspace_id=$(echo "$active_workspace" | jq -r '.id')

# 如果当前在特殊工作区，直接退出不做任何操作
if [[ "$workspace_name" == special:* ]] || [[ "$workspace_id" == special:* ]]; then
    # 可选：可以显示一个简短的提示，或者完全静默退出
    # notify-send "Workspace Toggle" "Cannot toggle in special workspace" -t 1000
    exit 0
fi

# 确保是普通工作区ID（应该是数字）
if ! [[ "$workspace_id" =~ ^[0-9]+$ ]]; then
    exit 0
fi

current_ws="$workspace_id"

# 获取当前工作区的所有窗口（排除特殊工作区的窗口）
windows=$(hyprctl clients -j | jq -r --arg ws "$current_ws" '
  .[] | select(.workspace.id == ($ws|tonumber)) | .address
')

if [ -z "$windows" ]; then
    # 如果没有窗口，静默退出
    exit 0
fi

# 检查当前工作区窗口状态（只检查第一个窗口）
first_window=$(echo "$windows" | head -1)
is_floating=$(hyprctl clients -j | jq -r --arg addr "$first_window" '
  .[] | select(.address == $addr) | .floating
')

# 获取当前工作区所在的显示器信息
monitor=$(hyprctl monitors -j | jq -r --arg ws "$current_ws" '
  .[] | select(.workspaces[] | .id == ($ws|tonumber)) // .[0]
')

width=$(echo "$monitor" | jq '.width')
height=$(echo "$monitor" | jq '.height')
x=$(echo "$monitor" | jq '.x')
y=$(echo "$monitor" | jq '.y')

# 切换逻辑
if [ "$is_floating" = "true" ]; then
    # 当前工作区有浮动窗口，将所有窗口转为平铺
    count=0
    while IFS= read -r addr; do
        # 只转换浮动窗口
        if hyprctl clients -j | jq -r --arg addr "$addr" '.[] | select(.address == $addr) | .floating' | grep -q "true"; then
            hyprctl dispatch togglefloating "address:$addr"
            count=$((count + 1))
        fi
    done <<<"$windows"

    # 可选：显示通知
    # notify-send "Workspace Toggle" "Tiled $count windows" -t 1000

else
    # 当前工作区所有窗口都是平铺的，转为浮动并排列
    window_count=$(echo "$windows" | wc -l)

    # 边距设置
    margin=30
    work_w=$((width - 2 * margin))
    work_h=$((height - 2 * margin))

    # 首先将所有窗口转为浮动
    while IFS= read -r addr; do
        hyprctl dispatch togglefloating "address:$addr"
    done <<<"$windows"

    # 等待窗口状态更新
    sleep 0.05

    # 根据窗口数量计算网格布局
    if [ "$window_count" -eq 1 ]; then
        # 单个窗口居中
        cell_w=$((work_w * 3 / 4))
        cell_h=$((work_h * 3 / 4))
        pos_x=$((x + margin + (work_w - cell_w) / 2))
        pos_y=$((y + margin + (work_h - cell_h) / 2))

        addr=$(echo "$windows" | head -1)
        hyprctl --batch "dispatch focuswindow address:$addr; dispatch resizeactive exact $cell_w $cell_h; dispatch moveactive exact $pos_x $pos_y"

    elif [ "$window_count" -eq 2 ]; then
        # 两个窗口左右排列
        cell_w=$((work_w / 2 - 10))
        cell_h=$((work_h - 40))

        i=0
        while IFS= read -r addr; do
            if [ $i -eq 0 ]; then
                pos_x=$((x + margin + 5))
            else
                pos_x=$((x + margin + cell_w + 15))
            fi
            pos_y=$((y + margin + 20))

            hyprctl --batch "dispatch focuswindow address:$addr; dispatch resizeactive exact $cell_w $cell_h; dispatch moveactive exact $pos_x $pos_y"
            i=$((i + 1))
        done <<<"$windows"

    else
        # 多个窗口：网格排列
        cols=$(echo "sqrt($window_count)" | bc)
        [ "$cols" -eq 0 ] && cols=1
        rows=$(((window_count + cols - 1) / cols))

        cell_w=$((work_w / cols - 10))
        cell_h=$((work_h / rows - 10))

        i=0
        while IFS= read -r addr; do
            row=$((i / cols))
            col=$((i % cols))

            pos_x=$((x + margin + 5 + col * (cell_w + 10)))
            pos_y=$((y + margin + 20 + row * (cell_h + 10)))

            hyprctl --batch "dispatch focuswindow address:$addr; dispatch resizeactive exact $cell_w $cell_h; dispatch moveactive exact $pos_x $pos_y"

            i=$((i + 1))
        done <<<"$windows"
    fi

    # 可选：显示通知
    # notify-send "Workspace Toggle" "Floating $window_count windows" -t 1000
fi
