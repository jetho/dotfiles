#!/bin/bash
#Get volume from alsa

mixer=$(amixer get Master | sed -ne '/Mono/s/.*\[\(.*\)%\].*/\1/p')
echo $mixer
