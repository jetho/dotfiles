#!/bin/zsh

SCREEN_WIDTH=$(xrandr | grep -Po --color=never "(?<=\ connected )[\d]+(?=x[\d]+)")

WIDTH=$(echo ${SCREEN_WIDTH} - 700 | bc)

conky -c ~/.conky/conkyrc | dzen2 -x 1150 -h 20 -fn inconsolata-11 -y 0 -w ${WIDTH} -ta r -fg #ffffff -bg #000000

