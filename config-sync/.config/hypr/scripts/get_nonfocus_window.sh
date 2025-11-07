#!/usr/bin/env bash
# 获取所有 Hyprland 打开的窗口信息：标题 + class
# 并高亮当前聚焦窗口

active_addr=$(hyprctl activewindow -j | jq -r '.address')

hyprctl clients -j | jq -r --arg active "$active_addr" '
  .[] |
  {
    addr: .address,
    title: (.title // "N/A"),
    class: (.class // "N/A")
  } |
  if .addr == $active then
    "* class=[\(.class)] || title=[\(.title)]"    # 当前聚焦窗口加星号标记
  else
    "  class=[\(.class)] || title=[\(.title)]"
  end
'

