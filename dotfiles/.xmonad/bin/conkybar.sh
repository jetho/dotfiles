#!/bin/zsh

SCREEN_WIDTH=$(xrandr | grep -Po --color=never "(?<=\ connected )[\d]+(?=x[\d]+)")

WIDTH=$(echo ${SCREEN_WIDTH} - 680 | bc)

conky -c ~/.conky/conkyrc | dzen2 -x 680 -h 18 -fn inconsolata-9 -y 0 -w ${WIDTH} -ta r -fg #ffffff -bg #000000

