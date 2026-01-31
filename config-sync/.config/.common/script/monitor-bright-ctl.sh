#!/usr/bin/env bash
# depend on
# - brightness
# - ddcutil

STEP=10

# 判断是否存在笔记本内屏
if brightnessctl -l | grep -q "backlight"; then
    case "$1" in
        up)
            brightnessctl set +${STEP}%
            ;;
        down)
            brightnessctl set ${STEP}%-
            ;;
    esac
    exit 0
fi

# 否则尝试外接显示器（DDC/CI）
case "$1" in
    up)
        ddcutil setvcp 10 +${STEP}
        ;;
    down)
        ddcutil setvcp 10 -${STEP}
        ;;
esac
