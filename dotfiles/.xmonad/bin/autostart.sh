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
xfce4-terminal +bc +uc -cr Green --title=tmux -e tmux -2 attach &
xfce4-terminal --title=ranger -e ranger &
firefox &
xfce4-terminal --title=weechat -e weechat-curses &
xfce4-terminal --title=ncmpcpp -e ncmpcpp &
xfce4-terminal --title=mutt -e mutt &
sleep 1 
xfce4-terminal --title=newsbeuter -e newsbeuter & 
xfce4-terminal --title=unison -e unison -repeat 600 raspi &
sleep 1 
xfce4-terminal --title=slurm -e "slurm -i eth0" &
#xfce4-terminal --title=nethogs -e sudo nethogs -d3 eth0 &
#xfce4-terminal --title=iftop -e sudo iftop -i eth0 &
sleep 1
xfce4-terminal --title=htop -e htop &

