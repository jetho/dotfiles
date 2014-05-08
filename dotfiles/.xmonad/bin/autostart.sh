#!/bin/sh

# set the cursor
xsetroot -cursor_name left_ptr

# Programs to launch at startup
sh ~/.fehbg &
~/.xmonad/bin/conkybar.sh &
~/.xmonad/bin/musicbar.sh &
trayer --edge bottom --align right --SetDockType true --SetPartialStrut true --expand true --width 10 --widthtype percent --transparent true --tint black --alpha 0 --height 20 &

# Programs which will run after Xmonad has started
sleep 1
urxvtc +bc +uc -cr Green -name tmux -e tmux -2 attach &
urxvtc -name ranger -e ranger &
firefox &
urxvtc -name weechat -e weechat-curses &
urxvtc -name ncmpcpp -e ncmpcpp &
urxvtc -name mutt -e mutt &
sleep 1 
urxvtc -name newsbeuter -e newsbeuter & 
urxvtc -name unison -e unison -repeat 600 raspi &
sleep 1 
urxvtc -name slurm -e slurm -i eth0 &
#urxvtc -name nethogs -e sudo nethogs -d3 eth0 &
#urxvtc -name iftop -e sudo iftop -i eth0 &
sleep 1
urxvtc -name htop -e htop &

