#!/bin/bash

i3-msg workspace 3:www
i3-msg exec x-www-browser && sleep 0.2

i3-msg workspace 4:news
i3-msg exec "urxvtc -title mutt -e mutt" && sleep 0.2
i3-msg exec "urxvtc -title newsbeuter -e newsbeuter" && sleep 0.2

i3-msg workspace 5:chat
i3-msg exec "urxvtc -title weechat -e weechat-curses" && sleep 0.2

i3-msg workspace 6:music
i3-msg exec "urxvtc -title ncmpcpp -e ncmpcpp" && sleep 0.2

i3-msg workspace 7:sys
i3-msg exec "urxvtc -title htop -e htop" && sleep 1
i3-msg exec "urxvtc -title slurm -e slurm -i eth0" && sleep 1
i3-msg split v
i3-msg exec "urxvtc -title nethogs -e sudo nethogs -d 3 eth0" && sleep 1

i3-msg workspace 1:term
i3-msg exec urxvtc
