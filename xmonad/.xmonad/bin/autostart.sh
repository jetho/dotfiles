#!/bin/sh

# set the cursor
xsetroot -cursor_name left_ptr

# Programs to launch at startup
sh ~/.fehbg &
~/.xmonad/bin/conkybar.sh &
~/.xmonad/bin/musicbar.sh &
trayer --edge bottom --align right --SetDockType true --SetPartialStrut true --expand true --width 10 --widthtype percent --transparent true --tint black --alpha 0 --height 20 &

# Programs which will run after Xmonad has started
xfce4-terminal --title=tmux -e "tmux -2 attach" &
sleep 3
xfce4-terminal --title=ranger -e ranger &
firefox &
xfce4-terminal --title=weechat -e weechat-curses &
xfce4-terminal --title=ncmpcpp -e ncmpcpp &
xfce4-terminal --title=mutt -e mutt &
sleep 2 
xfce4-terminal --title=newsbeuter -e newsbeuter & 
xfce4-terminal --title=sysmail -e "mutt -f /var/mail/$USER -e 'set timeout=10'" & 
sleep 2 
xfce4-terminal --title=log -e "sudo tail -f -n 50 /var/log/messages" &
sleep 2
xfce4-terminal --title=htop -e htop &

