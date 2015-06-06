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
roxterm --title=tmux -e tmux -2 attach &
roxterm --title=ranger -e ranger &
firefox &
roxterm --title=weechat -e weechat-curses &
roxterm --title=ncmpcpp -e ncmpcpp &
roxterm --title=mutt -e mutt &
sleep 1 
roxterm --title=newsbeuter -e newsbeuter & 
#roxterm --title=unison -e unison -repeat 600 raspi &
roxterm --title=sysmail -e "mutt -f /var/mail/$USER" &
sleep 1 
roxterm --title=slurm -e "slurm -i eth0" &
#roxterm --title=nethogs -e sudo nethogs -d3 eth0 &
#roxterm --title=iftop -e sudo iftop -i eth0 &
sleep 1
roxterm --title=htop -e htop &

