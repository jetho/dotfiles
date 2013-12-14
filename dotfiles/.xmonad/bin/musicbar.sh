#!/bin/zsh

FOREGROUND='#444444'
BACKGROUND='#000000'
BUTTON_COLOR='#646464'
SEPARATOR_COLOR='red'
SONG_COLOR='#c8e7a8'
SONG_PREFIX_COLOR='grey'
FAILURE_COLOR='grey'
FONT='inconsolata-10'

X_POS='0'
Y_POS='1024'
GEOMETRY='+0+0'
WIDTH=1280
HEIGHT=20
EXPAND='left'
TEXT_ALIGN='c'
SCREEN_ALIGN='l'

INTERVAL=3.0 # SLEEP INTERVAL

SEPARATOR="^fg(${SEPARATOR_COLOR}) | ^fg()" 

function MPD_BUTTONS {
    print "^fg(${BUTTON_COLOR})^ca(1,ncmpcpp stop)^i(/home/jens/.xmonad/xbm/stop.xbm)^ca() ^ca(1,ncmpcpp toggle)^i(/home/jens/.xmonad/xbm/playpause.xbm)^ca() ^ca(1,ncmpcpp prev)^i(/home/jens/.xmonad/xbm/prev.xbm)^ca() ^ca(1, ncmpcpp next)^i(/home/jens/.xmonad/xbm/next.xbm)^ca()"
}

function MPD_STATUS {
    MPD_CURRENT=$(ncmpcpp --now-playing '%a - %t')

    if [[ $? -eq 0 && "${MPD_CURRENT}" != "" ]]; then
            print "${SEPARATOR}^fg(${SONG_PREFIX_COLOR})Now Playing: ^fg(${SONG_COLOR})${MPD_CURRENT}"
    fi
}

while true
do
    print -n "`MPD_BUTTONS`"
    print -n "`MPD_STATUS`"
print --

    sleep $INTERVAL
done | dzen2  -fg "${FOREGROUND}" -bg "${BACKGROUND}" -fn "${FONT}" -w ${WIDTH} -h "${HEIGHT}" -ta "${TEXT_ALIGN}" -sa "${SCREEN_ALIGN}" -x "${X_POS}" -y "${Y_POS}" 

