# ~/.xmonad/autostart.sh
#!/bin/sh

# Programs to launch at startup
sh ~/.fehbg &

# Programs which will run after Xmonad has started
firefox &
urxvt &
urxvt -name weechat_startup -e weechat-curses &
urxvt -name ncmpcpp_startup -e ncmpcpp &
urxvt -name mutt_startup -e mutt &
sleep 2 
urxvt -name newsbeuter_startup -e newsbeuter & 
sleep 2
urxvt -name nethogs_startup -e sudo nethogs -d3 eth0 &
sleep 2  
urxvt -name slurm_startup -e slurm -i eth0 &
urxvt -name htop_startup -e htop &

