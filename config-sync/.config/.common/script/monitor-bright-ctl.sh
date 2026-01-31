#!/usr/bin/env bash
# depend on
# - brightness
# - ddcutil
# ddcutil 需要 DDC/CI 支持，亮度调节使用VCP接口，一般显示器带有，电视不一定有

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
