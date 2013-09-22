# ~/.xmonad/autostart.sh
#!/bin/sh

# set the cursor
xsetroot -cursor_name left_ptr

# Programs to launch at startup
sh ~/.fehbg &

# Programs which will run after Xmonad has started
firefox &
urxvt &
urxvt -name weechat -e weechat-curses &
urxvt -name ncmpcpp -e ncmpcpp &
urxvt -name mutt -e mutt &
sleep 2 
urxvt -name newsbeuter -e newsbeuter & 
sleep 2
urxvt -name nethogs -e sudo nethogs -d3 eth0 &
sleep 2  
urxvt -name slurm -e slurm -i eth0 &
urxvt -name htop -e htop &

