## debian-and-xmonad-Config

My workstation setup with Debian (Testing) and the XMonad Window Manager. 

#### Installing a minimal Debian System
- Get the Debian Netinstall Image: https://www.debian.org/devel/debian-installer/
- Choose "Advanced Options" -> "Expert Install"
- Disable root login
- Install only the "Standard System Utilities"!

#### Setup
<pre>
cd
wget https://raw.githubusercontent.com/jetho/debian-and-xmonad-Config/master/setup.sh
chmod u+x setup.sh
./setup.sh
</pre>

#### Enable password-less sudo for reboot, shutdown and network monitoring
- append the following lines to /etc/sudoers using "sudo visudo":
<pre>
# User alias specification
User_Alias      USERS  = user1, user2     # replace user1, user2 etc. with real user names
# Cmnd alias specification
Cmnd_Alias      SHUTDOWN = /sbin/shutdown, /sbin/reboot, /sbin/halt
Cmnd_Alias      MONITORING = /usr/sbin/iftop, /usr/sbin/iotop, /usr/sbin/nethogs
# User privilege specification
USERS ALL=(ALL) NOPASSWD: MONITORING, SHUTDOWN
</pre>


#### Favorite Firefox Add-ons
- [HTTPS Everywhere](https://www.eff.org/https-everywhere)
- [Adblock Edge](https://addons.mozilla.org/en-us/firefox/addon/adblock-edge/)
- [Omnibar](https://addons.mozilla.org/en-us/firefox/addon/omnibar/)
- [Disconnect](https://disconnect.me/)
- [RequestPolicy](https://addons.mozilla.org/en-us/firefox/addon/requestpolicy/)
- [NoScript](https://addons.mozilla.org/en-us/firefox/addon/noscript/)
- [Vimperator](https://addons.mozilla.org/en-us/firefox/addon/vimperator/)
- [Custom Tab Width](https://addons.mozilla.org/en-us/firefox/addon/custom-tab-width/)
- [Tile Tabs](https://addons.mozilla.org/en-us/firefox/addon/tile-tabs/)
- [GreaseMonkey](https://addons.mozilla.org/en-us/firefox/addon/greasemonkey/)
- [DownThemAll!](https://addons.mozilla.org/en-us/firefox/addon/downthemall/)
- [Session Manager](https://addons.mozilla.org/en-us/firefox/addon/session-manager/)
- [BetterPrivacy](https://addons.mozilla.org/en-us/firefox/addon/betterprivacy/)
- [Send to XBMC](https://addons.mozilla.org/en-US/firefox/addon/send-to-xbmc/)
- [FT DeepDark](https://addons.mozilla.org/de/firefox/addon/ft-deepdark/)

#### Additional key bindings available
- WIN + p => dmenu
- WIN + t => tmux
- WIN + v => vim
- WIN + SHIFT + v => gvim
- WIN + i => firefox
- WIN + r => ranger
- WIN + SHIFT + t => thunar
- WIN + SHIFT + s => Shutdown
- WIN + PageUp/PageDown => ncmpcpp Volume Up/Down
- Print => create screenshot and save into ~/Pictures

#### Screenshots

[![clean](https://raw.github.com/jetho/debian-and-xmonad-Config/master/screenshots/clean_th.png)](https://raw.github.com/jetho/debian-and-xmonad-Config/master/screenshots/clean.png)
[![dev](https://raw.github.com/jetho/debian-and-xmonad-Config/master/screenshots/dev_th.png)](https://raw.github.com/jetho/debian-and-xmonad-Config/master/screenshots/dev.png)
[![sys](https://raw.github.com/jetho/debian-and-xmonad-Config/master/screenshots/sys_th.png)](https://raw.github.com/jetho/debian-and-xmonad-Config/master/screenshots/sys.png)
